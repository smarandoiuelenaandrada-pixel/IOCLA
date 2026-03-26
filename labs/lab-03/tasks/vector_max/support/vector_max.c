// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
	int max;
	unsigned int i = 0;

	int maxim = v[i];
	i++;
	jump_here:
	
	if (v[i] > maxim) {
		maxim = v[i];
	}
	i++;
	
	if (i != len) {
		goto jump_here;
	}

	return maxim;
}
