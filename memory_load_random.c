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

/// Linear Feedback Shift Register now using 32 bits and XNOR. Source at:
/// http://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
/// http://www.ece.cmu.edu/~koopman/lfsr/index.html

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
struct list {
    uint64_t value;
    uint64_t pad[7];
};
typedef struct list element;

// =============================================================================
int main (int argc, char *argv[]) {
    uint64_t size=0;
    uint64_t repetitions=0;
    if(argc != 3) {
        printf("Please provide the number of repetitions and array size.\n");
        exit(EXIT_FAILURE);
    }

    repetitions = string_to_uint64(argv[1]);
    size = string_to_uint64(argv[2]);

    if (size % 8 != 0) {
        printf("The array size needs to be divisible by 8.\n");
        exit(EXIT_FAILURE);
    }
    printf("Struct size %"PRIu64"\n", (uint64_t)sizeof(element));
    printf("Repetitions:%"PRIu64" Size:%"PRIu64"\n", repetitions, size);
    printf("Memory to be accessed: %"PRIu64"KB\n", (uint64_t)(size*sizeof(element))/1024);


    uint64_t i = 0, j = 0;
    uint64_t jump = 1;
    uint64_t print = 0;
    uint64_t count[32];
    for (i = 0; i < 32; i++) {
        count[i] = 0;
    }

    unsigned int lfsr = 0x80000000;
    unsigned bit;

    element *ptr_vector;
    ptr_vector = (element *)malloc(sizeof(element) * size);

    for (i = 0; i < size; i++) {
        ptr_vector[i].value = i;
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");
    for (i = 0; i < repetitions; i++) {
        for (j = 0; j < size; j += 32) {
            /// Linear Feedback Shift Register
            bit  = ~((lfsr >> 0) ^ (lfsr >> 10) ^ (lfsr >> 11) ^ (lfsr >> 30) ) & 1;
            lfsr =  (lfsr >> 1) | (bit << 31);

            jump = lfsr % (size - 32);
            count[0] += ptr_vector[jump + 0].value;
            count[1] += ptr_vector[jump + 1].value;
            count[2] += ptr_vector[jump + 2].value;
            count[3] += ptr_vector[jump + 3].value;
            count[4] += ptr_vector[jump + 4].value;
            count[5] += ptr_vector[jump + 5].value;
            count[6] += ptr_vector[jump + 6].value;
            count[7] += ptr_vector[jump + 7].value;

            count[8] += ptr_vector[jump + 8].value;
            count[9] += ptr_vector[jump + 9].value;
            count[10] += ptr_vector[jump + 10].value;
            count[11] += ptr_vector[jump + 11].value;
            count[12] += ptr_vector[jump + 12].value;
            count[13] += ptr_vector[jump + 13].value;
            count[14] += ptr_vector[jump + 14].value;
            count[15] += ptr_vector[jump + 15].value;

            count[16] += ptr_vector[jump + 16].value;
            count[17] += ptr_vector[jump + 17].value;
            count[18] += ptr_vector[jump + 18].value;
            count[19] += ptr_vector[jump + 19].value;
            count[20] += ptr_vector[jump + 20].value;
            count[21] += ptr_vector[jump + 21].value;
            count[22] += ptr_vector[jump + 22].value;
            count[23] += ptr_vector[jump + 23].value;

            count[24] += ptr_vector[jump + 24].value;
            count[25] += ptr_vector[jump + 25].value;
            count[26] += ptr_vector[jump + 26].value;
            count[27] += ptr_vector[jump + 27].value;
            count[28] += ptr_vector[jump + 28].value;
            count[29] += ptr_vector[jump + 29].value;
            count[30] += ptr_vector[jump + 30].value;
            count[31] += ptr_vector[jump + 31].value;
        }
    }
    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i = 0; i < 8; i++) {
        print += count[i];
    }
    (void) print;
    printf("%"PRIu64"\n", print);
    exit(EXIT_SUCCESS);
}
