CC = /usr/bin/gcc
CPP = /usr/bin/gcc++
LD = /usr/bin/gcc
CFLAGS = $(FLAGS)
CPPFLAGS = $(FLAGS)
RM = rm -f

########################################################
# implicit rules
%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@


########################################################
################################################################################
#
# Some flags that may help during the debug
#
# Electric Fence: -lefence
# GConf: -pg
# Find Extra Errors: -pedantic -Wextra
################################################################################

# ~ ## DEBUG DEEP
# ~ FLAGS =  -Wall -O0 -ggdb  -Werror -lefence
# ~ LDFLAGS = -ggdb  -lefence

# ~ ## DEBUG DEEP FAST
# ~ FLAGS =  -Wall -O2 -ggdb  -Werror -lefence
# ~ LDFLAGS = -ggdb  -lefence

## DEBUG NORMAL
# ~ FLAGS =  -Wall -O1 -ggdb -Werror
# ~ LDFLAGS = -ggdb

# ~ ## EXECUTION
FLAGS = -fopenmp -O1  -Wall -Wextra -Werror -static # -ggdb
#-mno-mmx -mno-sse2 -mno-sse3 -mno-sse4.1 -mno-sse4.2
# -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-sse4.1 -mno-sse4.2

LDFLAGS = -fopenmp -static # -ggdb

########################################################

EXEC_C1 = control_complex
EXEC_C2 = control_conditional
EXEC_C3 = control_switch
EXEC_C4 = control_random
EXEC_C5 = control_small_bbl

EXEC_D1 = dependency_chain1
EXEC_D2 = dependency_chain2
EXEC_D3 = dependency_chain3
EXEC_D4 = dependency_chain4
EXEC_D5 = dependency_chain5
EXEC_D6 = dependency_chain6

EXEC_EI1 = execution_int_add_ind
EXEC_EI2 = execution_int_mul_ind
EXEC_EI3 = execution_int_div_ind

EXEC_EF1 = execution_fp_add_ind
EXEC_EF2 = execution_fp_mul_ind
EXEC_EF3 = execution_fp_div_ind

EXEC_M1 = memory_load_dep
EXEC_M2 = memory_load_ind
EXEC_M3 = memory_load_random
EXEC_M4 = memory_store_ind
EXEC_M5 = memory_store_random

EXEC_OMP1 = openmp_barrier_all_together
EXEC_OMP2 = openmp_barrier_master_slow
EXEC_OMP3 = openmp_critical
EXEC_OMP4 = openmp_false_sharing_pad00
EXEC_OMP5 = openmp_false_sharing_pad08
EXEC_OMP6 = openmp_false_sharing_pad24
EXEC_OMP7 = openmp_false_sharing_pad56
EXEC_OMP8 = openmp_sharing_pairs


########################################################

OBJ_C1 = control_complex.o
OBJ_C2 = control_conditional.o
OBJ_C3 = control_switch.o
OBJ_C4 = control_random.o
OBJ_C5 = control_small_bbl.o

OBJ_D1 = dependency_chain1.o
OBJ_D2 = dependency_chain2.o
OBJ_D3 = dependency_chain3.o
OBJ_D4 = dependency_chain4.o
OBJ_D5 = dependency_chain5.o
OBJ_D6 = dependency_chain6.o

OBJ_EI1 = execution_int_add_ind.o
OBJ_EI2 = execution_int_mul_ind.o
OBJ_EI3 = execution_int_div_ind.o

OBJ_EF1 = execution_fp_add_ind.o
OBJ_EF2 = execution_fp_mul_ind.o
OBJ_EF3 = execution_fp_div_ind.o

OBJ_M1 = memory_load_dep.o
OBJ_M2 = memory_load_ind.o
OBJ_M3 = memory_load_random.o
OBJ_M4 = memory_store_ind.o
OBJ_M5 = memory_store_random.o

OBJ_OMP1 = openmp_barrier_all_together.o
OBJ_OMP2 = openmp_barrier_master_slow.o
OBJ_OMP3 = openmp_critical.o
OBJ_OMP4 = openmp_false_sharing_pad00.o
OBJ_OMP5 = openmp_false_sharing_pad08.o
OBJ_OMP6 = openmp_false_sharing_pad24.o
OBJ_OMP7 = openmp_false_sharing_pad56.o
OBJ_OMP8 = openmp_sharing_pairs.o


all:	$(EXEC_C1) $(EXEC_C2) $(EXEC_C3) $(EXEC_C4) $(EXEC_C5)\
		$(EXEC_D1) $(EXEC_D2) $(EXEC_D3) $(EXEC_D4) $(EXEC_D5) $(EXEC_D6)\
		$(EXEC_EI1) $(EXEC_EI2) $(EXEC_EI3) \
		$(EXEC_EF1) $(EXEC_EF2) $(EXEC_EF3) \
		$(EXEC_M1) $(EXEC_M2) $(EXEC_M3) $(EXEC_M4) $(EXEC_M5) \
		$(EXEC_OMP1) $(EXEC_OMP2) $(EXEC_OMP3) $(EXEC_OMP4) $(EXEC_OMP5) $(EXEC_OMP6) $(EXEC_OMP7) $(EXEC_OMP8)

$(EXEC_C1): $(OBJ_C1)
	$(LD) $(LDFLAGS) -o $(EXEC_C1) $(OBJ_C1) $(LIBRARY)

$(EXEC_C2): $(OBJ_C2)
	$(LD) $(LDFLAGS) -o $(EXEC_C2) $(OBJ_C2) $(LIBRARY)

$(EXEC_C3): $(OBJ_C3)
	$(LD) $(LDFLAGS) -o $(EXEC_C3) $(OBJ_C3) $(LIBRARY)

$(EXEC_C4): $(OBJ_C4)
	$(LD) $(LDFLAGS) -o $(EXEC_C4) $(OBJ_C4) $(LIBRARY)

$(EXEC_C5): $(OBJ_C5)
	$(LD) $(LDFLAGS) -o $(EXEC_C5) $(OBJ_C5) $(LIBRARY)

###################

$(EXEC_D1): $(OBJ_D1)
	$(LD) $(LDFLAGS) -o $(EXEC_D1) $(OBJ_D1) $(LIBRARY)

$(EXEC_D2): $(OBJ_D2)
	$(LD) $(LDFLAGS) -o $(EXEC_D2) $(OBJ_D2) $(LIBRARY)

$(EXEC_D3): $(OBJ_D3)
	$(LD) $(LDFLAGS) -o $(EXEC_D3) $(OBJ_D3) $(LIBRARY)

$(EXEC_D4): $(OBJ_D4)
	$(LD) $(LDFLAGS) -o $(EXEC_D4) $(OBJ_D4) $(LIBRARY)

$(EXEC_D5): $(OBJ_D5)
	$(LD) $(LDFLAGS) -o $(EXEC_D5) $(OBJ_D5) $(LIBRARY)

$(EXEC_D6): $(OBJ_D6)
	$(LD) $(LDFLAGS) -o $(EXEC_D6) $(OBJ_D6) $(LIBRARY)

###################

$(EXEC_EI1): $(OBJ_EI1)
	$(LD) $(LDFLAGS) -o $(EXEC_EI1) $(OBJ_EI1) $(LIBRARY)

$(EXEC_EI2): $(OBJ_EI2)
	$(LD) $(LDFLAGS) -o $(EXEC_EI2) $(OBJ_EI2) $(LIBRARY)

$(EXEC_EI3): $(OBJ_EI3)
	$(LD) $(LDFLAGS) -o $(EXEC_EI3) $(OBJ_EI3) $(LIBRARY)

###################

$(EXEC_EF1): $(OBJ_EF1)
	$(LD) $(LDFLAGS) -o $(EXEC_EF1) $(OBJ_EF1) $(LIBRARY)

$(EXEC_EF2): $(OBJ_EF2)
	$(LD) $(LDFLAGS) -o $(EXEC_EF2) $(OBJ_EF2) $(LIBRARY)

$(EXEC_EF3): $(OBJ_EF3)
	$(LD) $(LDFLAGS) -o $(EXEC_EF3) $(OBJ_EF3) $(LIBRARY)

###################

$(EXEC_M1): $(OBJ_M1)
	$(LD) $(LDFLAGS) -o $(EXEC_M1) $(OBJ_M1) $(LIBRARY)

$(EXEC_M2): $(OBJ_M2)
	$(LD) $(LDFLAGS) -o $(EXEC_M2) $(OBJ_M2) $(LIBRARY)

$(EXEC_M3): $(OBJ_M3)
	$(LD) $(LDFLAGS) -o $(EXEC_M3) $(OBJ_M3) $(LIBRARY)

$(EXEC_M4): $(OBJ_M4)
	$(LD) $(LDFLAGS) -o $(EXEC_M4) $(OBJ_M4) $(LIBRARY)

$(EXEC_M5): $(OBJ_M5)
	$(LD) $(LDFLAGS) -o $(EXEC_M5) $(OBJ_M5) $(LIBRARY)

###################

$(EXEC_OMP1): $(OBJ_OMP1)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP1) $(OBJ_OMP1) $(LIBRARY)

$(EXEC_OMP2): $(OBJ_OMP2)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP2) $(OBJ_OMP2) $(LIBRARY)

$(EXEC_OMP3): $(OBJ_OMP3)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP3) $(OBJ_OMP3) $(LIBRARY)

$(EXEC_OMP4): $(OBJ_OMP4)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP4) $(OBJ_OMP4) $(LIBRARY)

$(EXEC_OMP5): $(OBJ_OMP5)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP5) $(OBJ_OMP5) $(LIBRARY)

$(EXEC_OMP6): $(OBJ_OMP6)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP6) $(OBJ_OMP6) $(LIBRARY)

$(EXEC_OMP7): $(OBJ_OMP7)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP7) $(OBJ_OMP7) $(LIBRARY)

$(EXEC_OMP8): $(OBJ_OMP8)
	$(LD) $(LDFLAGS) -o $(EXEC_OMP8) $(OBJ_OMP8) $(LIBRARY)

###################

clean:
	-$(RM) $(OBJ_C1) $(OBJ_C2) $(OBJ_C3) $(OBJ_C4) $(OBJ_C5) \
			$(OBJ_D1) $(OBJ_D2) $(OBJ_D3) $(OBJ_D4) $(OBJ_D5) $(OBJ_D6) \
			$(OBJ_EI1) $(OBJ_EI2) $(OBJ_EI3) \
			$(OBJ_EF1) $(OBJ_EF2) $(OBJ_EF3) \
			$(OBJ_M1) $(OBJ_M2) $(OBJ_M3) $(OBJ_M4) $(OBJ_M5) \
			$(OBJ_OMP1) $(OBJ_OMP2) $(OBJ_OMP3) $(OBJ_OMP4) $(OBJ_OMP5) $(OBJ_OMP6) $(OBJ_OMP7) $(OBJ_OMP8)
	-$(RM) $(EXEC_C1) $(EXEC_C2) $(EXEC_C3) $(EXEC_C4) $(EXEC_C5) \
			$(EXEC_D1) $(EXEC_D2) $(EXEC_D3) $(EXEC_D4) $(EXEC_D5) $(EXEC_D6) \
			$(EXEC_EI1) $(EXEC_EI2) $(EXEC_EI3) \
			$(EXEC_EF1) $(EXEC_EF2) $(EXEC_EF3) \
			$(EXEC_M1) $(EXEC_M2) $(EXEC_M3) $(EXEC_M4) $(EXEC_M5) \
			$(EXEC_OMP1) $(EXEC_OMP2) $(EXEC_OMP3) $(EXEC_OMP4) $(EXEC_OMP5) $(EXEC_OMP6) $(EXEC_OMP7) $(EXEC_OMP8)
	@echo All clean!
	@echo

