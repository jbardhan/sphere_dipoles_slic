#!/bin/bash

mkdir /big_scratch/bard415

mkdir /home/bard415/outputfiles_ionPair_sphere20_90deg_density1

for angle in 0.0 90.0 180.0
do
    for distance in 0.0 1.6 3.2 4.8 6.4 8.0 9.6 11.2 12.8 14.4 15.2 16.0 16.8 17.2
    do
	rm sphere_20/dummy.pqr
	cp salt_bridges/ionPair_sphere20/ionPair_10deg_trans${distance}_${angle}.pqr sphere_20/dummy.pqr
        python /home/bard415/repos/pygbe/pygbe/main.py -c sphere_20/sphere_20_1.config sphere_20/ > /big_scratch/bard415/output_sym_diel_1_${distance}_${angle}
        python /home/bard415/repos/pygbe/pygbe/slic.py -c sphere_20/sphere_20_1.config sphere_20/ > /big_scratch/bard415/output_asym_diel_1_${distance}_${angle}

	cp /big_scratch/bard415/output* /home/bard415/outputfiles_ionPair_sphere20_90deg_density1
    done 
done

#    for distance in 0.0 0.8 1.6 2.4 3.2 4.0 4.8 5.6 6.4 7.2 8.0 8.8 9.6 10.4 11.2 12.0 12.8 13.6 14.4 15.2 16.0 16.8 17.2

#rm sphere_20/dummy.pqr

#cp salt_bridges/ionPair_sphere20/ionPair_10deg_trans0.0_0.0.pqr sphere_20/dummy.pqr

#python /home/bard415/repos/pygbe/pygbe/main.py -c sphere_20/sphere_20_1.config sphere_20/  > /home/bard415/output1

#python /home/bard415/repos/pygbe/pygbe/slic.py -c sphere_20/sphere_20_1.config sphere_20/ # > /home/bard415/output2

