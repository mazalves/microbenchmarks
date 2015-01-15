#!/bin/bash
################################################################################
## MICROBENCHMARK
################################################################################
## MICROBENCHMARK - CONTROL -- (1 - 3)
echo "Using result.txt and out.txt"
echo "Running 66 apps, 20x"
echo "##############" >> result.txt; date >> result.txt
echo "##############" >> out.txt; date >> out.txt
echo -n -e "\n01"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n control_complex;     /usr/bin/time -f ';r:%E;u:%U;s:%S' ./control_complex      2000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n02"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n control_conditional; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./control_conditional 10000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n03"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n control_random;      /usr/bin/time -f ';r:%E;u:%U;s:%S' ./control_random        200000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n04"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n control_small_bbl;   /usr/bin/time -f ';r:%E;u:%U;s:%S' ./control_small_bbl    10000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n05"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n control_switch;      /usr/bin/time -f ';r:%E;u:%U;s:%S' ./control_switch        5000000000; } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - DEPENDENCY -- (1 - 6)
echo -n -e "\n06"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n dependency_chain1; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./dependency_chain1 500000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n07"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n dependency_chain2; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./dependency_chain2 500000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n08"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n dependency_chain3; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./dependency_chain3 500000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n09"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n dependency_chain4; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./dependency_chain4 500000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n10"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n dependency_chain5; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./dependency_chain5 500000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n11"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n dependency_chain6; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./dependency_chain6 500000000; } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - EXECUTION FP -- (4 - 5)
echo -n -e "\n12"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n fp_add; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./execution_fp_add_ind 500000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n13"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n fp_div; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./execution_fp_div_ind  50000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n14"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n fp_mul; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./execution_fp_mul_ind 500000000; } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - EXECUTION INT -- (4 - 6)
echo -n -e "\n15"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n int_add; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./execution_int_add_ind 1000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n16"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n int_div; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./execution_int_div_ind   10000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n17"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n int_mul; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./execution_int_mul_ind  500000000; } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - MEMORY LOAD DEP -- (10 - 14)
echo -n -e "\n18"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_00016kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 65536)) $((16384 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n19"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_00032kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 32768)) $((32768 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n20"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_00064kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 16384)) $((65536 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n21"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_00128kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 8192)) $((131072 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n22"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_00256kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 4096)) $((262144 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n23"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_00512kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 2048)) $((524288 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n24"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_01024kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 1024)) $((1048576 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n25"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_02048kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 512)) $((2097152 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n26"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_04096kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 256)) $((4194304 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n27"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_08192kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 128)) $((8388608 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n28"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_16384kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 64)) $((16777216 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n29"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_dep_32768kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_dep $((64 * 32)) $((33554432 / 64)) ; } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - MEMORY LOAD IND -- (15 - 19)
echo -n -e "\n30"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_00016kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 2048)) $((16384 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n31"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_00032kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 1024)) $((32768 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n32"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_00064kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 512)) $((65536 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n33"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_00128kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 256)) $((131072 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n34"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_00256kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 128)) $((262144 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n35"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_00512kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 64)) $((524288 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n36"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_01024kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 32)) $((1048576 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n37"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_02048kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 16)) $((2097152 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n38"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_04096kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 8)) $((4194304 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n39"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_08192kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 4)) $((8388608 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n40"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_16384kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 2)) $((16777216 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n41"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n ld_ind_32768kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_load_ind $((2048 * 1)) $((33554432 / 64)); } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - MEMORY STORE IND -- (25 - 29)
echo -n -e "\n42"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_00016kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 2048)) $((16384 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n43"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_00032kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 1024)) $((32768 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n44"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_00064kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 512)) $((65536 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n45"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_00128kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 256)) $((131072 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n46"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_00256kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 128)) $((262144 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n47"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_00512kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 64)) $((524288 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n48"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_01024kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 32)) $((1048576 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n49"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_02048kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 16)) $((2097152 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n50"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_04096kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 8)) $((4194304 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n51"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_08192kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 4)) $((8388608 / 64)) ; } 2>> result.txt >> out.txt; done
echo -n -e "\n52"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_16384kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 2)) $((16777216 / 64)); } 2>> result.txt >> out.txt; done
echo -n -e "\n53"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n st_ind_32768kb; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./memory_store_ind $((2048 * 1)) $((33554432 / 64)); } 2>> result.txt >> out.txt; done
################################################################################
## MICROBENCHMARK - MEMORY STORE RANDOM -- (1 - 25)
echo -n -e "\n54"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_barrier_all_together; /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_barrier_all_together 20000000      ; } 2>> result.txt >> out.txt; done
echo -n -e "\n55"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_barrier_master_slow;  /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_barrier_master_slow  2000000 20000 ; } 2>> result.txt >> out.txt; done
echo -n -e "\n56"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_critical;             /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_critical             20000000      ; } 2>> result.txt >> out.txt; done
################################################################################
echo -n -e "\n57"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_false_sharing_pad00;  /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_false_sharing_pad00  2000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n58"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_false_sharing_pad08;  /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_false_sharing_pad08  2000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n59"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_false_sharing_pad24;  /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_false_sharing_pad24  2000000000; } 2>> result.txt >> out.txt; done
echo -n -e "\n60"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_false_sharing_pad56;  /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_false_sharing_pad56  2000000000; } 2>> result.txt >> out.txt; done
################################################################################
echo -n -e "\n61"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_sharing_pairs_00016kb;        /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_sharing_pairs  10000 16384   ; } 2>> result.txt >> out.txt; done;
echo -n -e "\n62"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_sharing_pairs_00032kb;        /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_sharing_pairs  10000 32768   ; } 2>> result.txt >> out.txt; done;
echo -n -e "\n63"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_sharing_pairs_00256kb;        /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_sharing_pairs  10000 262144   ; } 2>> result.txt >> out.txt; done;
echo -n -e "\n64"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_sharing_pairs_00512kb;        /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_sharing_pairs  10000 524288   ; } 2>> result.txt >> out.txt; done;
echo -n -e "\n65"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_sharing_pairs_01024kb;        /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_sharing_pairs  10000 1048576   ; } 2>> result.txt >> out.txt; done;
echo -n -e "\n66"; for i in `seq 1 20`; do echo -n .; { >&2 echo -n openmp_sharing_pairs_02048kb;        /usr/bin/time -f ';r:%E;u:%U;s:%S' ./openmp_sharing_pairs  10000 2097152   ; } 2>> result.txt >> out.txt; done;
echo "Done!"
