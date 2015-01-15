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
    uint64_t repetitions;
    if(argc == 2) {
        repetitions = string_to_uint64(argv[1]);
    }
    else {
        printf("Please provide the number of repetitions.\n");
        exit(EXIT_FAILURE);
    }

    uint64_t i = 0;
    double count = 0;
    double in = 0.00;

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    asm volatile("push %0"::"r"(in):);

    asm volatile("subsd %%xmm0, %%xmm0" : : : "xmm0");
    asm volatile("subsd %%xmm1, %%xmm1" : : : "xmm1");
    asm volatile("subsd %%xmm2, %%xmm2" : : : "xmm2");
    asm volatile("subsd %%xmm3, %%xmm3" : : : "xmm3");
    asm volatile("subsd %%xmm4, %%xmm4" : : : "xmm4");
    asm volatile("subsd %%xmm5, %%xmm5" : : : "xmm5");
    asm volatile("subsd %%xmm6, %%xmm6" : : : "xmm6");
    asm volatile("subsd %%xmm7, %%xmm7" : : : "xmm7");

    asm volatile("movsd (%%rsp), %%xmm0" : : : "xmm0");
    asm volatile("movsd (%%rsp), %%xmm1" : : : "xmm1");
    asm volatile("movsd (%%rsp), %%xmm2" : : : "xmm2");
    asm volatile("movsd (%%rsp), %%xmm3" : : : "xmm3");
    asm volatile("movsd (%%rsp), %%xmm4" : : : "xmm4");
    asm volatile("movsd (%%rsp), %%xmm5" : : : "xmm5");
    asm volatile("movsd (%%rsp), %%xmm6" : : : "xmm6");
    asm volatile("movsd (%%rsp), %%xmm7" : : : "xmm7");

    asm volatile("pop %%rbx" : : : "rbx");

    for (i = 1; i <= repetitions; i++) {
        asm volatile("addsd %%xmm0, %%xmm0" : : : "xmm0");
        asm volatile("addsd %%xmm1, %%xmm1" : : : "xmm1");
        asm volatile("addsd %%xmm2, %%xmm2" : : : "xmm2");
        asm volatile("addsd %%xmm3, %%xmm3" : : : "xmm3");
        asm volatile("addsd %%xmm4, %%xmm4" : : : "xmm4");
        asm volatile("addsd %%xmm5, %%xmm5" : : : "xmm5");
        asm volatile("addsd %%xmm6, %%xmm6" : : : "xmm6");
        asm volatile("addsd %%xmm7, %%xmm7" : : : "xmm7");

        asm volatile("addsd %%xmm0, %%xmm0" : : : "xmm0");
        asm volatile("addsd %%xmm1, %%xmm1" : : : "xmm1");
        asm volatile("addsd %%xmm2, %%xmm2" : : : "xmm2");
        asm volatile("addsd %%xmm3, %%xmm3" : : : "xmm3");
        asm volatile("addsd %%xmm4, %%xmm4" : : : "xmm4");
        asm volatile("addsd %%xmm5, %%xmm5" : : : "xmm5");
        asm volatile("addsd %%xmm6, %%xmm6" : : : "xmm6");
        asm volatile("addsd %%xmm7, %%xmm7" : : : "xmm7");

        asm volatile("addsd %%xmm0, %%xmm0" : : : "xmm0");
        asm volatile("addsd %%xmm1, %%xmm1" : : : "xmm1");
        asm volatile("addsd %%xmm2, %%xmm2" : : : "xmm2");
        asm volatile("addsd %%xmm3, %%xmm3" : : : "xmm3");
        asm volatile("addsd %%xmm4, %%xmm4" : : : "xmm4");
        asm volatile("addsd %%xmm5, %%xmm5" : : : "xmm5");
        asm volatile("addsd %%xmm6, %%xmm6" : : : "xmm6");
        asm volatile("addsd %%xmm7, %%xmm7" : : : "xmm7");

        asm volatile("addsd %%xmm0, %%xmm0" : : : "xmm0");
        asm volatile("addsd %%xmm1, %%xmm1" : : : "xmm1");
        asm volatile("addsd %%xmm2, %%xmm2" : : : "xmm2");
        asm volatile("addsd %%xmm3, %%xmm3" : : : "xmm3");
        asm volatile("addsd %%xmm4, %%xmm4" : : : "xmm4");
        asm volatile("addsd %%xmm5, %%xmm5" : : : "xmm5");
        asm volatile("addsd %%xmm6, %%xmm6" : : : "xmm6");
        asm volatile("addsd %%xmm7, %%xmm7" : : : "xmm7");
    }

    asm volatile("push $0x0":::);
    asm volatile("movsd %%xmm0, (%%rsp)" : : : );
    asm volatile("mov (%%rsp), %0" : "=r"(count) : : );
    asm volatile("pop %%rbx" : : : "rbx");

    printf("%lf\n", count);

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");


    exit(EXIT_SUCCESS);
}
