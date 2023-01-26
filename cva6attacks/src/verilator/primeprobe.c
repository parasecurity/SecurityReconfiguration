#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <unistd.h>

#define CACHE_SETS 256
#define CACHE_WAYS 8
#define CACHE_LINE_SIZE 16
#define cache_size (CACHE_SETS * CACHE_WAYS * CACHE_LINE_SIZE) / CACHE_LINE_SIZE

#define iterations 1 	//number of times to run the attack
#define threshold 25	//threshold above which we have a cache miss
	
volatile unsigned miss[cache_size] = {0};	//array which holds the access time of each array element

volatile unsigned diff[cache_size];


/*************PRIME FUNCTION******************/

void prime(__uint128_t *array){
	__uint128_t temp = 1;
	for (int i = 0 ; i < cache_size ; i++ ){
		array[i] = 16;		//fill the cache with arbitrary data
		temp = array[i];	//read it in order to load the array into cache
	}
}



/*************PROBE FUNCTION******************/

void probe(__uint128_t *array){
	__uint128_t temp = 1;	//temp variable to read the array data in order to load them into the cache
	register unsigned long start,end;	//variables to measure access time
	for ( int i = 0 ; i < cache_size ; i++){
		asm volatile ("rdcycle %0" : "=r" (start));
		temp = array[i];
		asm volatile ("rdcycle %0" : "=r" (end));
		diff[i] = end - start;
		if(diff[i] > threshold){
			miss[i]++;
		}
	}
}



/**************TROJAN CODE*********************/

void trojan(){
	//trojan will evict specific cache lines according to the secret key
	__uint128_t trojan_array[cache_size];
	// for ( int i = 0 ; i < cache_size; i++){

	// }
}


/*************VICTIM FUNCTION******************/

void victim(){
	//access arbitrary points in cache in order to test if probe can find the evictions
	__uint128_t test_array[cache_size] __attribute__((aligned(128)));
	__uint128_t temp;

	//load data into the entire cache
	for(int i = 0 ; i < cache_size; i++){
		//if(i%256 == 0){	//i is a multiple of 256
			test_array[i] = 156;
			temp = test_array[i];
		//}
	}

}



int main(){
	__uint128_t prime_array[cache_size] __attribute__((aligned(128))); //define array the size of the cache
	//uint64_t addr;

	for (int i = 0 ; i < iterations ; i ++){
		prime(prime_array);		//prime the cache
		//victim();
		probe(prime_array);		//probe the cache
	}

	int evictions = 0 ;
	for( int i = 0 ; i < cache_size ; i++){
		int way = i/256;
		int set = i - (way*256);
		//if((i+1)%256 == 0){
			printf("Index %d, Cache way %d, Set %d got evicted %d times\n",i,way,set,miss[i]);
			printf("Address of index %d is 0x%x\n",i,&prime_array[i]);
			//evictions++;
		//}
		
	}

	printf("Total evictions %d\n",evictions);
	

	return 0;

}