/*
 * Copyright (C) 2014  Marco Antonio Zanata Alves (mazalves at inf.ufrgs.br)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <inttypes.h>

// =============================================================================
uint64_t string_to_uint64(char *string) {
    uint64_t result = 0;
    char c;

    for (  ; (c = *string ^ '0') <= 9 && c >= 0; ++string) {
        result = result * 10 + c;
    }
    return result;
};

// =============================================================================
int main (int argc, char *argv[]) {
    uint64_t num_threads, repetitions, size;

    omp_set_num_threads(2);
    num_threads = omp_get_max_threads();

    if(argc == 3) {
        repetitions = string_to_uint64(argv[1]) / num_threads;
        size = string_to_uint64(argv[2]) / 8;
        printf("Size:%lu bytes\n", size*sizeof(uint64_t));
    }
    else {
        printf("Please provide the number of repetitions and size.\n");
        exit(EXIT_FAILURE);
    }

    uint64_t i, j, k, l, x=0, y=0;
    uint64_t data[size];


    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i = 1; i <= repetitions; i++) {
        #pragma omp parallel
        {
            int th_id = omp_get_thread_num();
            /// Produce
            if (th_id == 0) {
                for (k = 0; k < size/2; k++) {
                    data[k] = k;
                }
            }
            if (th_id == 1) {
                for (j = size/2; j < size; j++) {
                    data[j] = j;
                }
            }

            /// Consume
            if (th_id == 0) {
                for (k = size/2; k < size; k++) {
                    x+= data[k];
                }
            }
            if (th_id == 1) {
                for (l = 0; l < size/2; l++) {
                    y+= data[l];
                }
            }

            #pragma omp barrier
        }
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    printf("%"PRIu64" %"PRIu64" %"PRIu64" %"PRIu64" %"PRIu64"\n", num_threads, repetitions, size, x, y);
    exit(EXIT_SUCCESS);
}
