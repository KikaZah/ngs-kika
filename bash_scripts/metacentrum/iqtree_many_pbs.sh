#!/bin/bash
#PBS -N iqtree
#PBS -l select=1:ncpus=15:mem=10gb:scratch_local=10gb:os=debian9
#PBS -l walltime=24:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add iqtree-1.6.8

data_dir='/storage/brno3-cerit/home/kika/sags/alignments'
sg_trees='/storage/brno3-cerit/home/kika/sags/sg_trees'

#copy files to scratch
cp $data_dir'/'*.trimal_0.5.aln $SCRATCHDIR

#compute on scratch
cd $SCRATCHDIR

for f in *.trimal_0.5.aln ; do
 guide=guide_${f%.trimal_0.5.aln}
 guide_tree=$guide'.treefile'
 bb=1000
 iqtree -m LG+F+G -nt AUTO -ntmax $PBS_NUM_PPN -quiet -s ${f} -pre $guide
 iqtree -m LG+C20+F+G -nt AUTO -ntmax $PBS_NUM_PPN -bb $bb -quiet -s ${f} -ft $guide_tree
done

#copy files back
rm *.trimal_0.5.aln
cp * $sg_trees
