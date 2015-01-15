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
struct list {
    uint64_t value;
    uint64_t pad[7];
};
typedef struct list element;

// =============================================================================
struct Data {
    omp_lock_t omp_lock;
    uint64_t flag;
    element *work;
    uint32_t pad[16];
};
typedef struct Data th_data;

// =============================================================================
int main(int argc, char** argv){
    th_data *th_pair_data;
    uint64_t elements, repetitions, num_threads;
    uint64_t count, all_sum = 0;

    if (argc == 3) {
        repetitions = string_to_uint64(argv[1]);
        elements = string_to_uint64(argv[2]);
        num_threads = omp_get_max_threads();
        if (num_threads % 2 != 0){
            printf("Please execute with an even number of threads.\n");
            exit(EXIT_FAILURE);
        }
    }
    else {
        printf("Please provide the number of repetitions and elements.\n");
        exit(EXIT_FAILURE);
    }

    th_pair_data = (th_data*) malloc(num_threads/2 * sizeof(th_data));
    for (count = 0; count < num_threads/2; count++) {
        omp_init_lock(&th_pair_data[count].omp_lock);
        th_pair_data[count].flag = 0;
        th_pair_data[count].work = (element*) malloc(elements * sizeof(element));
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");


    #pragma omp parallel reduction(+:all_sum)
    {
        uint64_t i, j;
        uint64_t th_id, th_pair, th_role;

        th_id = omp_get_thread_num();
        th_pair = th_id / 2; /// divide the pairs of threads
        th_role = th_id % 2; /// 0 producer, 1 consumer

        for (j = 0; j < repetitions; ) {
            /// Producer
            if (th_role == 0) {
                omp_set_lock(&th_pair_data[th_pair].omp_lock);
                // ~ #pragma omp critical (WORK)
                {
                    // ~ #pragma omp flush(th_pair_data[th_pair].flag)
                    if (th_pair_data[th_pair].flag == 0) {
                        for (i = 0; i < elements; i++) {
                            th_pair_data[th_pair].work[i].value = 42;
                        }
                        th_pair_data[th_pair].flag = 1;
                        j++;
                    }
                }
                omp_unset_lock(&th_pair_data[th_pair].omp_lock);
            }
            /// Consumer
            else {
                omp_set_lock(&th_pair_data[th_pair].omp_lock);
                // ~ #pragma omp critical (WORK)
                {
                    // ~ #pragma omp flush(th_pair_data[th_pair].flag)
                    if (th_pair_data[th_pair].flag == 1) {
                        for (i = 0; i < elements; i++) {
                            all_sum += th_pair_data[th_pair].work[i].value;
                        }
                        th_pair_data[th_pair].flag = 0;
                        j++;
                    }
                }
                omp_unset_lock(&th_pair_data[th_pair].omp_lock);
            }
        }
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    printf("%"PRIu64" %"PRIu64" %"PRIu64" %"PRIu64"\n", num_threads, elements, repetitions, all_sum);
    exit(EXIT_SUCCESS);
};
