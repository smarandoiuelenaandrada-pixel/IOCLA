// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "len_xor.h"

int my_strlen(const char *str)
{
	int i = 0;
	
	while (*(str + i) != '\0') {
		i++;
	}
	return i;
	
}

void equality_check(const char *str)
{
	int len = my_strlen(str);
	//printf("lenght = %d\n", len);
	char c1, c2;

	for (int i = 0; i < len; ++i) {
		c1 = *(str + i);
		c2 = *(str + ((i + (1 << i)) % len));

		if(!(c1 ^ c2)) {
			printf("Address of %c: %p\n", c1, str + i);
		}
	}
}
