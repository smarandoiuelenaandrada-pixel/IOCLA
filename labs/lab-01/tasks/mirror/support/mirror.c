// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

void mirror(char *s)
{
	int len = strlen(s);
	
	for (int i = 0, j = len - 1; i < j; ++i, --j) {
		*(s + i) = *(s + i) ^ *(s + j);
		*(s + j) = *(s + i) ^ *(s + j);
		*(s + i) = *(s + i) ^ *(s + j);
	}
	printf("%s", s);
}
