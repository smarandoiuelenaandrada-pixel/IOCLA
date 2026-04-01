// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
	
	int n = strlen(s);
	char *p = strstr(s , pattern);

	if (!p) {
		return s;
	}

	int k = strlen(p);
	char *c = malloc(200);

	for (int i = 0; i < m; i++) {
		p++;
	}

	for (int i = 0; i < n - k; i++) {
		c[i] = s[i];
	}
	strcat(c, p);
	
	
	return c;
	
}

