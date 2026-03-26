// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	int n = 8 * sizeof(*number);
	int nr2 = (*number) << bits;
	int nr3 = (*number) >> (n - bits);
	(*number) = nr2 | nr3;
	printf("%d\n", *number);
}

void rotate_right(unsigned int *number, int bits)
{
	int n = 8 * sizeof(*number);
	int nr2 = (*number) >> bits;
	int nr3 = (*number) << (n - bits);
	(*number) = nr2 | nr3;
	printf("%d\n", *number);
}