#!/bin/sh
#PBS -N Augustus
#PBS -q default
#PBS -l select=1:ncpus=1:mem=16gb:scratch_local=10gb:os=debian9
#PBS -l walltime=2:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add augustus-3.3.1

#setting augustus config file environment variable
augustus_configs=/storage/brno3-cerit/home/kika/pelomyxa/augustus
mkdir $SCRATCHDIR/augustus_configs
cp -r $augustus_configs/* $SCRATCHDIR || exit 1
export AUGUSTUS_CONFIG_PATH=$SCRATCHDIR/augustus_configs
export PATH=$PATH:/software/augustus/3.3.1/src/bin:/software/augustus/3.3.1/src/scripts

#copy file to scratch
cd $augustus_configs
cp augustus_dataset_deduplicated.gb $SCRATCHDIR

dataset='augustus_dataset_deduplicated.gb'

#augustus runs on 1 core only
cd $SCRATCHDIR

# #SPLIT GENES
# randomSplit.pl $dataset 100

#CREATE A META PARAMETERS FILE
new_species.pl --species=pelomyxa

# cp augustus_dataset_deduplicated.gb.* $augustus_configs
cp -r pelomyxa $augustus_configs
