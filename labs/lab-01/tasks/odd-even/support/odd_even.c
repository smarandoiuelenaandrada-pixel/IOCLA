// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "odd_even.h"

void print_binary(int number, int nr_bits)
{
	char *bits = malloc(nr_bits * sizeof(char));

	if (!bits) {
		fprintf(stderr, "malloc() failed!\n");
		exit(-1);
	}
	for (int i = 0; i < nr_bits; ++i) {
		*(bits + i) = number & 1;
		number = number >> 1;
 	}
	printf("0b");
	for (int i = nr_bits - 1; i >= 0; --i) {
		printf("%d", *(bits + i));
	}
	printf("\n");
	free(bits);
}

void check_parity(int *numbers, int n)
{
	for (int i = 0; i < n; ++i) {
		if (numbers[i] & 1) {
			printf("0x%08x\n",numbers[i]);
		} else {
			print_binary(numbers[i], 8);
		}
	}
}
