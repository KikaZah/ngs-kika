#!/bin/sh

of='/home/nenarokova/tools/OrthoFinder-2.1.2/orthofinder'
new_prot=''
prev_blast='/home/anzhelika/orthofinder_dataset_for_Anna/orthofinder/Results_Jan03/WorkingDirectory/'
# blast_method=diamond

/home/nenarokova/tools/OrthoFinder-2.1.2/orthofinder -f $new_prot -b $prev_blast -t 32
# -S $blast_method