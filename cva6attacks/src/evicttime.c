#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#define CACHE_SETS 256
#define CACHE_WAYS 8
#define CACHE_LINE_SIZE 16
#define cache_size (CACHE_SETS * CACHE_WAYS * CACHE_LINE_SIZE) / CACHE_LINE_SIZE


//simple victim function

void victim(){
	int a,b,c = 0;
	a = 15;
	b = 35;
	c = a + b; 
	c = c * b;
	c = c * a;
	c = c +c;
}

//evict the set specified from the cache

void evict(int set){
	__uint128_t evictarray[cache_size] __attribute__((aligned(128)));
	__uint128_t temp;
	printf("Address of evictarray is 0x%x\n",&evictarray[0]);
	for ( int i = 0 ; i < cache_size ; i ++){
		if (i%256 == 0){	//evict all way sof the same set
			evictarray[i+set] = 15;
			temp = evictarray[i+set];
		}
	}
}



int main(){

	volatile unsigned time_diff[256] = {0} ;
	register unsigned long start, end, diff1, diff2;

	for ( int i = 0 ; i < 256 ; i++){

		//measure the time of the victim function without any evictions
		asm volatile ("rdcycle %0" : "=r" (start));
		victim();
		asm volatile ("rdcycle %0" : "=r" (end));
		diff1 = end - start;

		evict(i);

		//measure the time of the victim function again after evicting set i from the cache
		asm volatile ("rdcycle %0" : "=r" (start));
		victim();
		asm volatile ("rdcycle %0" : "=r" (end));
		diff2 = end - start;

		time_diff[i] = diff2 - diff1;	//save the time difference between the two victim executions, after evicting set i

	}

	for ( int i = 0; i < 256 ; i++){
		printf("Time difference after evicting cache set %d is %d\n",i,time_diff[i]);
	}



	return 0;
}