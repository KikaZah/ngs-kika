#!/bin/bash
#PBS -N HISAT2
#PBS -l select=1:ncpus=15:mem=20gb:scratch_local=100gb
#PBS -l walltime=02:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add hisat2-2.0.5
module add samtools-1.3.1

datadir='/storage/brno3-cerit/home/kika/prototheca/wickerhamii/'
outidr=$datadir'mapping/hisat2/'
genome=$datadir'Pwic_genome.fa'
fw=$datadir'BILC_trimmed_1.fq.gz'
rv=$datadir'BILC_trimmed_2.fq.gz'

#copy files to scratch
cp $genome $fw $rv $SCRATCHDIR


#compute on scratch
cd $SCRATCHDIR

index='pwic_ht2'
unmapped_unpaired=$index'_unmapped_unpaired.fq'
unmapped_paired=$index'_unmapped_paired.fq'
sam=$index'.sam'
report=$index'_report.txt'
bam=$index'_unsorted.bam'
sorted=$index'_sorted.bam'

hisat2-build -p $PBS_NUM_PPN $genome $index
hisat2 -p $PBS_NUM_PPN -x $index -1 $fw -2 $rv --un-gz $unmapped_unpaired --un-conc-gz $unmapped_paired -S $sam 2> $report

samtools view -bS $sam > $bam -@ $PBS_NUM_PPN
samtools sort -o $sorted -@ PBS_NUM_PPN $bam 
samtools index $sorted

#copy files back
rm $genome $fw $rv
cp -r * $outidr
