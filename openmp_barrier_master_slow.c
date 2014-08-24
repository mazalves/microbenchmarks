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

int main (int argc, char *argv[]) {

    uint64_t num_threads, repetitions, master_repetitions;

    num_threads = omp_get_max_threads();
    if(argc == 3) {
        repetitions = atoi(argv[1]) / num_threads;
        master_repetitions = atoi(argv[2]);
    }
    else {
        printf("Please provide the number of repetitions.\n");
        exit(EXIT_FAILURE);
    }

    uint64_t i, j;

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i = 1; i <= repetitions; i++) {
        #pragma omp parallel
        {
            if (omp_get_thread_num() == 0) {
                for (j = 1; j <= master_repetitions; j++);
            }
            #pragma omp barrier
        }
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    exit(EXIT_SUCCESS);
}

