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
    uint64_t inner_repetitions;
    if(argc == 2) {
        repetitions = string_to_uint64(argv[1]);
        if (repetitions % 10) {
            printf("Please provide the correct number of inner-repetitions.\n");
            exit(EXIT_FAILURE);
        }
        inner_repetitions = repetitions / 10;

    }
    else {
        printf("Please provide the number of repetitions.\n");
        exit(EXIT_FAILURE);
    }

    uint64_t i = 0;
    uint64_t jump = 1;
    uint64_t print = 1;

    uint64_t jump_1 = inner_repetitions * 1;
    uint64_t jump_2 = inner_repetitions * 2;
    uint64_t jump_3 = inner_repetitions * 3;
    uint64_t jump_4 = inner_repetitions * 4;
    uint64_t jump_5 = inner_repetitions * 5;
    uint64_t jump_6 = inner_repetitions * 6;
    uint64_t jump_7 = inner_repetitions * 7;
    uint64_t jump_8 = inner_repetitions * 8;
    uint64_t jump_9 = inner_repetitions * 9;
    uint64_t jump_10 = inner_repetitions * 10;

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    for (i = 0; i < repetitions; i++) {
        switch (jump) {
            case 1:
                if (i > jump_1)
                    jump++;
                    print += 1;
            break;

            case 2:
                if (i > jump_2)
                    jump++;
                    print += 2;
            break;

            case 3:
                if (i > jump_3)
                    jump++;
                    print += 3;
            break;

            case 4:
                if (i > jump_4)
                    jump++;
                    print += 4;
            break;

            case 5:
                if (i > jump_5)
                    jump++;
                    print += 5;
            break;

            case 6:
                if (i > jump_6)
                    jump++;
                    print += 6;
            break;

            case 7:
                if (i > jump_7)
                    jump++;
                    print += 7;
            break;

            case 8:
                if (i > jump_8)
                    jump++;
                    print += 8;
            break;

            case 9:
                if (i > jump_9)
                    jump++;
                    print += 9;
            break;

            case 10:
                if (i > jump_10)
                    jump++;
                    print += 10;
            break;

            default:
                printf("Please provide the correct number of inner-repetitions.\n");
                exit(EXIT_FAILURE);
            break;
        }
    }

    asm volatile ("nop");
    asm volatile ("nop");
    asm volatile ("nop");

    (void) print;
    printf("%"PRIu64"\n", print);
    exit(EXIT_SUCCESS);
}
