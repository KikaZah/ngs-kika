#!/bin/bash
#PBS -N BBduk
#PBS -l select=1:ncpus=30:mem=50gb:scratch_local=50gb
#PBS -l walltime=0:20:00
#PBS -m ae
#PBS -j oe
cat $PBS_NODEFILE

# inicializace konkretni verze JAVA
module add jdk-7

bbduk='/auto/brno2/home/kika/tools/bbmap/bbduk.sh'
adapt='/auto/brno2/home/kika/tools/bbmap/resources/adapters.fa'

read_dir='/auto/brno3-cerit/nfs4/home/kika/pelomyxa/reads/genome/deep_hiseq/'
fw='p1_r1.fastq.gz'
rv='p1_r2.fastq.gz'

trimdir='/auto/brno3-cerit/nfs4/home/kika/pelomyxa/reads/genome/deep_hiseq/'
name='p1'
trimmed_fw=$name'_trimmed_1.fq.gz'
trimmed_rv=$name'_trimmed_2.fq.gz'
report=$name"_report.txt"

#copy data to scratch
cd $read_dir
cp $adapt $SCRATCHDIR
cp $fw $rv $SCRATCHDIR

cd $SCRATCHDIR
$bbduk overwrite=true in1=$fw in2=$rv out1=$trimmed_fw out2=$trimmed_rv ref=$adapt usejni=t qtrim=rl trimq=20 ktrim=r k=22 mink=11 hdist=2 tpe tbo t=30 2> $report

cp $trimmed_fw $trimmed_rv $report $trimdir
