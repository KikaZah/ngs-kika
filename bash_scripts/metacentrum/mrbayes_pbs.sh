#!/bin/sh
#PBS -N mrbayes
#PBS -l select=1:ncpus=2:mem=10gb:scratch_local=5gb
#PBS -l walltime=04:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add mrbayes-3.2.4

data_dir='/storage/brno3-cerit/home/kika/trafficking/ESCRT/snf7/ver4/mrbayes/'

#copy files to scratch
cp $data_dir'snf7.trimal_gt_0.8.nxs' $SCRATCHDIR

#run on scratch
cd $SCRATCHDIR

aln='snf7.trimal_gt_0.8.nxs'
name=${aln%.nxs}

echo "
begin mrbayes;
   set autoclose=yes;
   lset 
		rates=gamma
		ngammacat=4;
   prset
   		aamodelpr=fixed(WAG);
   mcmcp 
   		ngen=1000000 
   		printfreq=10000
   		samplefreq=1000
   		nchains=4 
   		savebrlens=yes
 		startingtree=random
   		filename=$name;
   	mcmc;
sump burnin=250;
sumt burnin=250;
end;" >> $aln

mpirun -np $PBS_NUM_PPN mb-mpi $aln

#copy files back
rm $aln
cp -r * data_dir
