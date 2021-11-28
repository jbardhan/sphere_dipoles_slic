#!/bin/bash

mkdir /big_scratch/bard415

for angle in 0.0 10.0 20.0 30.0 40.0 50.0 60.0 70.0 80.0 90.0 100.0 110.0 120.0 130.0 140.0 150.0 160.0 170.0 180.0
do
    for distance in 2.0 2.267
    do
	rm sphere_5067/dummy.pqr
	cp salt_bridges/ionPair_sphere5067/ionPair_10deg_trans${distance}_${angle}.pqr sphere_5067/dummy.pqr
        python /home/bard415/repos/pygbe/pygbe/main.py -c sphere_5067/sphere_5067_4.config sphere_5067/ > /big_scratch/bard415/output_sym_diel_1_${distance}_${angle}
        python /home/bard415/repos/pygbe/pygbe/slic.py -c sphere_5067/sphere_5067_4.config sphere_5067/ > /big_scratch/bard415/output_asym_diel_1_${distance}_${angle}
    done 
done

mkdir /home/bard415/outputfiles_ionPair_sphere5067_10deg_density4

mv /big_scratch/bard415/output* /home/bard415/outputfiles_ionPair_sphere5067_10deg_density4

#rm sphere_20/dummy.pqr

#cp salt_bridges/ionPair_sphere20/ionPair_10deg_trans0.0_0.0.pqr sphere_20/dummy.pqr

#python /home/bard415/repos/pygbe/pygbe/main.py -c sphere_20/sphere_20_1.config sphere_20/  > /home/bard415/output1

#python /home/bard415/repos/pygbe/pygbe/slic.py -c sphere_20/sphere_20_1.config sphere_20/ # > /home/bard415/output2

