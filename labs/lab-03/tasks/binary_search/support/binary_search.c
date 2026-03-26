// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "binary_search.h"

int binary_search(int *v, int len, int dest)
{
	int start = 0;
	int end = len - 1;
	int middle = 0;

	loop:

	if (start > end) {
		goto  notfound;
	}

	middle = (start + end) / 2;

	if (v[middle] == dest) {
		goto out;
	}
	
	if (v[middle] < dest) {
		goto bigger;
	}

	
	end = middle - 1;
	goto loop;

	bigger:
	start = middle + 1;
	goto loop;

	out:
	return middle;

	notfound:
	return -1;
}
