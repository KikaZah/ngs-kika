#!/bin/sh

workdir='/mnt/mokosz/home/kika/workdir/'
input=$workdir'eut_missing.fa'
out=$workdir'eut_missing.nommpred.tsv'
lineage=9
# 1) Mt
# 2) MRO
# 3) Piroplasma
# 4) Chlorophyta
# 5) Dictyostelium
# 6) Plasmodium
# 7) stramenopiles
# 8) Toxoplasma
# 9) Trypanosomatida

NommPred.py -i $input -o $out -l $lineage --overwrite
