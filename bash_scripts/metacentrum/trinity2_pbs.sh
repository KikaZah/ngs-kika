#!/bin/bash
#PBS -N Trinity
#PBS -l select=1:ncpus=30:mem=100gb:scratch_local=50gb
#PBS -l walltime=96:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add trinity-2.6.5

datadir='/storage/brno3-cerit/home/kika/prototheca/zopfii'
outdir=$datadir'/trinity/'

#copy files to scratch
cp $datadir'/'*trimmed*.fq.gz $SCRATCHDIR

fw=SRR8447028_trimmed_1.fq.gz,SRR8447029_trimmed_1.fq.gz,SRR8447030_trimmed_1.fq.gz
rv=SRR8447028_trimmed_2.fq.gz,SRR8447029_trimmed_2.fq.gz,SRR8447030_trimmed_2.fq.gz
report='pzop_trinity_report.txt'


#compute on scratch
cd $SCRATCHDIR
Trinity --seqType fq --left $fw --right $rv --max_memory 100G --CPU $PBS_NUM_PPN 2> $report

#copy files back
rm *trimmed*fq.gz
cp -r * $outdir
