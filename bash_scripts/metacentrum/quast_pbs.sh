#!/bin/bash
#PBS -N Quast
#PBS -l select=1:ncpus=10:mem=3gb:scratch_local=5gb
#PBS -l walltime=02:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add quast-4.6.3

datadir='/storage/brno3-cerit/home/kika/prototheca/wickerhamii/'
# mapping=$datadir'bw2_mapping/pilon10/'
# outdir=$datadir'quast/'

#copy files to scratch
# cp $mapping'ku80_p10_bw2_sorted.bam' $SCRATCHDIR
cp $datadir'genome_db/pwic_genome.fa' $SCRATCHDIR

f='pwic_genome.fa'
# bam='ku80_p10_bw2_sorted.bam'
output=$datadir'quast/genome/'
min_contig=500


#compute on scratch
cd $SCRATCHDIR
# quast.py -o $output -t $PBS_NUM_PPN --glimmer --min-contig $min_contig --eukaryote --bam $bam $f
quast.py -o $SCRATCHDIR -t $PBS_NUM_PPN --glimmer --min-contig $min_contig --eukaryote $f


#copy results to your folder
# rm $f $bam
rm $f
cp -r * $output
