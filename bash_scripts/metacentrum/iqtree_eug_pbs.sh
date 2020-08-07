#!/bin/bash
#PBS -N IQT-mitUFB
#PBS -q default
#PBS -l select=1:ncpus=20:mem=20gb:scratch_local=1gb:os=debian9
#PBS -l walltime=02:00:00
#PBS -m ae
#PBS -j oe

cat $PBS_NODEFILE

#add module
module add iqtree-1.6.8

datadir='/storage/brno3-cerit/home/kika/sags/mit/ver5/concat_ufb'

#copy files to scratch
cp $datadir'/'* $SCRATCHDIR
# cp $datadir'guide_acsl_seqs.treefile' $SCRATCHDIR

#compute on scratch
cd $SCRATCHDIR
aln='mit_concat.aln'
# guide='guide_concat'
# guide_tree=$guide'.treefile'
bb=1000

iqtree -s $aln -bb $bb -nt AUTO -ntmax $PBS_NUM_PPN -m TEST -quiet -wsr
# iqtree -s $aln -bb $bb -nt AUTO -ntmax $PBS_NUM_PPN -m LG4X -quiet -wsr

# iqtree -m LG+F+G -nt AUTO -ntmax $PBS_NUM_PPN -quiet -s $aln -pre $guide
# iqtree -m LG+C60+F+G -nt AUTO -ntmax $PBS_NUM_PPN -b $bb -quiet -s $aln -ft $guide_tree -wsr

#copy files back
rm $aln
cp * $datadir
