// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>

#include "pixel.h"
#include "pixels.h"
#define GET_PIXEL(a, i ,j) (*(*((a) + (i)) + (j)))

void swap_rows(struct pixel *a, struct pixel *b, int nr)
{
	for (int i = 0; i < nr; ++i) {
		struct pixel c = a[i];
		a[i] = b[i];
		b[i] = c;
	} 
}
void reverse_pic(struct picture *pic)
{
	for (int i = 0; i < pic->height / 2; ++i) {
		swap_rows(pic->pix_array[i], pic->pix_array[pic->height - i - 1], pic->width);
	}
}

void color_to_gray(struct picture *pic)
{
	for (int i = 0; i < pic->height; i++) {
		for (int j = 0; j < pic->width; j++) {
			struct pixel *p = &GET_PIXEL(pic->pix_array, i, j);
			p->R = 0.3 * p->R;
			p->G = 0.59 * p->G;
			p->B = 0.11 * p->B;

		}
	}
}
