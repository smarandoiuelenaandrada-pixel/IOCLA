// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "iterate.h"
#include "array.h"

void print_chars(void)
{
	unsigned char* char_ptr = (unsigned char *) &v;

	for (int i = 0; i < sizeof(v) / sizeof((*char_ptr)); ++i) {
		printf("%p -> 0x%x\n", char_ptr, *char_ptr);
		char_ptr++;
	}
	printf("-------------------------------\n");
}

void print_shorts(void)
{
	unsigned short* char_ptr = (unsigned short *) &v;

	for (int i = 0; i < sizeof(v) / sizeof((*char_ptr)); ++i) {
		printf("%p -> 0x%x\n", char_ptr, *char_ptr);
		char_ptr++;
	}
	printf("-------------------------------\n");
}

void print_ints(void)
{
	unsigned int* char_ptr = (unsigned int *) &v;

	for (int i = 0; i < sizeof(v) / sizeof((*char_ptr)); ++i) {
		printf("%p -> 0x%x\n", char_ptr, *char_ptr);
		char_ptr++;
	}
	printf("-------------------------------\n");
}

void print_long_longs(void)
{
	unsigned long long* char_ptr = (unsigned long long *) &v;

	for (int i = 0; i < sizeof(v) / sizeof((*char_ptr)); ++i) {
		printf("%p -> 0x%llx\n", char_ptr, *char_ptr);
		char_ptr++;
	}
	printf("-------------------------------\n");
}
