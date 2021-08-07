#!/usr/bin/env python

import os, sys, subprocess, argparse, re, logging, errno
import numpy as np
import mymm

parser = argparse.ArgumentParser(description="This program generates a set of rotated and possibly translated versions of the input PQR.", prog = sys.argv[0])

parser.add_argument('--inputpqr', metavar = 'input_molecule.pqr')
parser.add_argument('--output', metavar = 'output_molecule_base_for_filenames')
parser.add_argument('--iscentered', metavar = 'True if molecule is already centered at origin', default = True)
parser.add_argument('--numrotations', metavar = 'Number of rotations (2 means 0 and 180)', type = int, default = 2)
parser.add_argument('--translate', metavar = 'How far to translate along +X', type = float, default = 0.0)

args = parser.parse_args(sys.argv[1:])

samplegroup = mymm.Molecule()
samplegroup.read_pqr(args.inputpqr)

numbers = np.linspace(0.0, 180.0, args.numrotations)
#print(numbers)

for i in numbers:
    print("Current rotation is " + str(i) + ".\n")

    rotatedgroup = mymm.Molecule(samplegroup.atoms)
    rotatedgroup.rotateZ(i)
    rotatedgroup.translate(x=args.translate,y=0.0,z=0.0)
    rotatedgroup.write_apbs_pqr(args.output + str(i) + ".pqr")
    del rotatedgroup

    
