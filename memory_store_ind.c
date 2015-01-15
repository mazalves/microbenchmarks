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
struct list {
    uint64_t value;
    char pad[56];
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

    if (size % 32 != 0) {
        printf("The array size needs to be divisible by 32 (due to unrolling).\n");
        exit(EXIT_FAILURE);
    }
    printf("Struct size %"PRIu64"\n", (uint64_t)sizeof(element));
    printf("Repetitions:%"PRIu64" Size:%"PRIu64"\n", repetitions, size);
    printf("Memory to be accessed: %"PRIu64"KB\n", (uint64_t)(size*sizeof(element))/1024);

    uint64_t i = 0;
    uint64_t jump = 0;
    uint64_t print = 0;

    element *ptr_vector;
    ptr_vector = (element *)valloc(sizeof(element) * size);

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");
    for (i = 0; i < repetitions; i++) {
        for (jump = 0; jump <= size - 32; jump += 32) {
            ptr_vector[jump + 0].value = jump;
            ptr_vector[jump + 1].value = jump;
            ptr_vector[jump + 2].value = jump;
            ptr_vector[jump + 3].value = jump;
            ptr_vector[jump + 4].value = jump;
            ptr_vector[jump + 5].value = jump;
            ptr_vector[jump + 6].value = jump;
            ptr_vector[jump + 7].value = jump;

            ptr_vector[jump + 8].value = jump;
            ptr_vector[jump + 9].value = jump;
            ptr_vector[jump + 10].value = jump;
            ptr_vector[jump + 11].value = jump;
            ptr_vector[jump + 12].value = jump;
            ptr_vector[jump + 13].value = jump;
            ptr_vector[jump + 14].value = jump;
            ptr_vector[jump + 15].value = jump;

            ptr_vector[jump + 16].value = jump;
            ptr_vector[jump + 17].value = jump;
            ptr_vector[jump + 18].value = jump;
            ptr_vector[jump + 19].value = jump;
            ptr_vector[jump + 20].value = jump;
            ptr_vector[jump + 21].value = jump;
            ptr_vector[jump + 22].value = jump;
            ptr_vector[jump + 23].value = jump;

            ptr_vector[jump + 24].value = jump;
            ptr_vector[jump + 25].value = jump;
            ptr_vector[jump + 26].value = jump;
            ptr_vector[jump + 27].value = jump;
            ptr_vector[jump + 28].value = jump;
            ptr_vector[jump + 29].value = jump;
            ptr_vector[jump + 30].value = jump;
            ptr_vector[jump + 31].value = jump;
            // ~ asm volatile ("nop");
        }
        print += ptr_vector[0].value;
        ptr_vector[0].pad[0] = 0;
    }
    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    printf("%"PRIu64"\n", print);
    exit(EXIT_SUCCESS);
}
