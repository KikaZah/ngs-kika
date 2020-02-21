	#!/usr/bin/env python3
import os

os.chdir('/Dcko/ownCloud/proteromonas/PXMP2_tree/')
files = [x for x in os.listdir() if 'mafft.aln' in x]

for file in files:
	print(file)
	file_name = file.split('.')[0] #+ '_' + file.split('_')[1]
	aut = 'automated1'
	gt = 0.5 #fraction of sequences with a gap allowed
	st = 0.001 #minimum average similarity allowed.

	output = '{}.trimal_{}.aln'.format(file_name, aut)
	os.system('trimal -in {} -out {} -{} -fasta'.format(file, output, aut))
	
	# output = '{}.trimal_{}.aln'.format(file_name, gt)
	# os.system('/home/kika/programs/trimAl/source/trimal -in {} -out {} -gt {} -fasta'.format(file, output, gt))

	# output = '{}.trimal_{}_{}.aln'.format(file_name, gt, st)
	# os.system('/home/kika/programs/trimAl/source/trimal -in {} -out {} -gt {} -st {} -fasta'.format(
	# file, output, gt, st))
