#!/usr/bin/env python3
import os
from Bio import SeqIO

os.chdir('/Users/kika/ownCloud/pelomyxa_schiedti/peroxisomes/mastig_lopit/orthofinder/OGs_sc_tran-supp/alns/')
files = [x for x in os.listdir() if x.endswith('.mafft.aln')]

for file in files:
	print(file)
	fname = file.split('.')[0]
	with open('{}_ends.aln'.format(fname), 'w') as result:
		for seq in SeqIO.parse(file, 'fasta'):
			result.write('>{}\n{}\n'.format(seq.name, seq.seq[len(seq.seq)-12:len(seq.seq)]))
