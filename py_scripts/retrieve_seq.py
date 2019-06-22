#!/usr/bin/env python3
from Bio import SeqIO

infasta = SeqIO.parse('/home/kika/programs/blast-2.5.0+/bin/eg_deeg.fa', 'fasta')
infile = open('/home/kika/ownCloud/euglenophytes/pt_proteome/EG_list.txt')
out = open('/home/kika/ownCloud/euglenophytes/pt_proteome/EG_pt_proteins2.fa', 'w')

retrieve = set()
for line in infile:
	retrieve.add(line[:-1])

for seq in infasta:
	if seq.name in retrieve:
		out.write('>{}\n{}\n'.format(seq.description, seq.seq))
	else:
		# print(seq.description)
		pass
out.close()
