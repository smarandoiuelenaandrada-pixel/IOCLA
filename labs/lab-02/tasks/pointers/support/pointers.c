// SPDX-License-Identifier: BSD-3-Clause

#include <stddef.h>

#include "pointers.h"

int my_strlen(const char *string);

int my_strcmp(const char *s1, const char *s2)
{
	for (int i = 0; ; ) {
		if (s1[i] == '\0' && s2[i] == '\0') {
			break;
		}

		if (s1[i] == s2[i]) {
			i++;
		}

		if (s1[i] != s2[i]) {
			return s1[i] - s2[i];
		}
	}

	return 0;
}

void *my_memcpy(void *dest, const void *src, size_t n)
{
    if (!dest || !src) {
		return dest;
	}

    unsigned char* d = (unsigned char *) dest;
    const unsigned char* s = (const unsigned char *) src;


    for (size_t i = 0; i < n; i++) {
        d[i] = s[i]; 
    }

    return dest;
}

int my_strlen(const char *string)
{
	int n = 0;

	for (int i = 0; ; ++i) {
		if (string[i] == '\0') {
			break;
		}
		n++;
	}
	return n;
}

char *my_strcpy(char *dest, const char *src)
{
	if (!src) {
		return NULL;
	}
	
	int n = my_strlen(src);

	for (int i = 0; i < n; ++i) {
		dest[i] = src[i];
	}
	dest[n] = '\0';
	return dest;
}
