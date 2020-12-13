#!/usr/bin/env python3
import os
import subprocess

mafft = '/Users/kika/miniconda3/bin/mafft'

#align de-novo
os.chdir('/Users/kika/ownCloud/Mic60-Mgm1-Opa1/eukprot-hmms/')
files = [x for x in os.listdir() if x.endswith('opa1_seed-dataset.faa')]

for file in files:
	print(file)
	out = '{}.mafft.aln'.format(file.split('.fa')[0])
	log = '{}.mafft.log'.format(file.split('.fa')[0])
	subprocess.call('{} --thread 7 --localpair --maxiterate 1000 --inputorder {} > {} 2> {}'.format(
		mafft, file, out, log), shell=True)

# #add to aligned sequences
# os.chdir('/Users/kika/ownCloud/')
# existing = 'membrane-trafficking/queries/SNAREs/R_SNARES_all.afa'
# new = 'Euglena_gracilis/membrane_trafficking_plastid/trees-rhab/r_euglenozoa.fa'
# out = 'Euglena_gracilis/membrane_trafficking_plastid/trees-rhab/r.mafft.aln'
# subprocess.call('{} --add {} --thread 6 --inputorder {} > {}'.format(mafft, new, existing, out), shell=True)
