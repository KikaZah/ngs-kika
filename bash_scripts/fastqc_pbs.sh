#!/bin/sh
#PBS -N FastQC
#PBS -l select=1:ncpus=1:mem=50gb:scratch_local=100gb
#PBS -l walltime=2:30:00
#PBS -m ae
#PBS -j oe
#hashes explained: 
#-N job name, -q queue, -l select resources, -l walltime, -m ae, -j oe mail will be send at the end of the job

#get name of the machine where the job is run
cat $PBS_NODEFILE

fastqc='/auto/brno2/home/kika/tools/miniconda3/pkgs/fastqc-0.11.7-5/bin/fastqc'
read_dir='/auto/brno3-cerit/nfs4/home/kika/pelomyxa/reads/genome/deep_hiseq/'
out_dir='/auto/brno3-cerit/nfs4/home/kika/pelomyxa/reads/genome/deep_hiseq/fastqc/' #must be present beforewards

#just in case scratch is not created, but never happened to me:
if [ ! -d "$SCRATCHDIR" ] ; then echo "Scratch directory is not created!" 1>&2; exit 1; fi
echo $SCRATCHDIR
trap 'clean_scratch' TERM EXIT

#load modules, may not be necessary
#https://wiki.metacentrum.cz/wiki/FastQC
module add fastQC-0.11.5

#copy data to scratch
cd $read_dir
cp p4_r1.fastq.gz p4_r2.fastq.gz p5_r1.fastq.gz p5_r2.fastq.gz $SCRATCHDIR

#chdir to scratch and perform operations
cd $SCRATCHDIR
fastqc -o $out_dir 'p4_r1.fastq.gz'
fastqc -o $out_dir 'p4_r2.fastq.gz'
fastqc -o $out_dir 'p5_r1.fastq.gz'
fastqc -o $out_dir 'p5_r2.fastq.gz'
