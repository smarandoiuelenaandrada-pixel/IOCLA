// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
	
	int n = strlen(s);
	char s[n];
	int m = strlen(pattern);
	int i = 0;

	for (int i = 0; i < m; ++i) {
		if (s[i] != pattern[i]) {
			continue;
		}
	}
	
	char *p, *q;
	
	p = strstr(s, pattern);
	q = strstr(s, pattern);
	
	//printf("%s --- %s", p , q);
}
