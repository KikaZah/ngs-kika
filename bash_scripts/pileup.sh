#!/bin/bash

file_dir='/media/4TB1/diplonema/mapping/DNA_to_contigs/1618/'
reference=$file_dir'1618_C01-D02.fasta'
input=$file_dir'1618_C01-D02_bw2.sam'
output=$file_dir'1618_C01-D02_bw2_stat.tsv'

/home/kika/tools/bbmap/pileup.sh in=$input out=$output ref=$reference
