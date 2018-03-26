#!/bin/bash

genome='/media/4TB1/blastocrithidia/genome_assembly/p57_scaffolds.fa'
gff='/media/4TB1/blastocrithidia/orthofinder/sg_ogs/alignments/jac_renamed/p57_ins_only.gff'
out='/media/4TB1/blastocrithidia/orthofinder/sg_ogs/alignments/jac_renamed/p57_ins_nt.txt'

bedtools getfasta -s -name -fi $genome -bed $gff 
#-fo $out
