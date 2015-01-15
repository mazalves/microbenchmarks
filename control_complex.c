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
    uint64_t i=0, j=-1, k=2, l=3, m=-1, n=5,o=6;
    uint64_t repetitions;
    if(argc == 2) {
        repetitions = string_to_uint64(argv[1]);
    }
    else {
        printf("Please provide the number of repetitions.\n");
        exit(EXIT_FAILURE);
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i=0;i<repetitions;i++) {
        if (i%2 == 0) {
            j++;
            switch (j & 3) {
                case 0:
                case 1:
                    k++;
                break;

                case 2:
                case 3:
                    l++;
                break;
            }
        }
        else {
            m++;
            switch (m & 7) {
                case 0:
                case 1:
                case 2:
                case 3:
                    n++;
                break;

                case 4:
                case 5:
                case 6:
                case 7:
                    o++;
                break;
            }
        }
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    printf("k,l,n,o %"PRIu64" %"PRIu64" %"PRIu64" %"PRIu64"\n",k,l,n,o);
    exit(EXIT_SUCCESS);
}
