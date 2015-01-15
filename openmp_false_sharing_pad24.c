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
struct T_Element {
    uint64_t sum;
    char pad[24];
};
typedef struct T_Element t_element;

// =============================================================================
int main (int argc, char *argv[]) {
    uint64_t num_threads, repetitions;

    if(argc == 2) {
        num_threads = omp_get_max_threads();
        repetitions = string_to_uint64(argv[1]) / num_threads;
        printf("Size:%lu bytes\n", sizeof(t_element));
    }
    else {
        printf("Please provide the number of repetitions.\n");
        exit(EXIT_FAILURE);
    }

    uint64_t i, th_id;
    uint64_t all_sum = 0;

    t_element thread_data[num_threads];
    for (i = 0; i < num_threads; i++) {
        thread_data[i].sum = 0;
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    #pragma omp parallel private(i, th_id)
    {
        th_id = omp_get_thread_num();
        for (i = 0; i < repetitions; i++) {
            thread_data[th_id].sum += i;
        }
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i = 0; i < num_threads; i++) {
        all_sum += thread_data[i].sum;
    }

    printf("%"PRIu64" %"PRIu64" %"PRIu64"\n", num_threads, repetitions, all_sum);
    exit(EXIT_SUCCESS);
}
