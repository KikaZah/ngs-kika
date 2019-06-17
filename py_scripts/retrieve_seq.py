#!/usr/bin/env python3
from Bio import SeqIO

infasta = SeqIO.parse('/home/kika/MEGAsync/Data/EL_RNAseq/el_DEEZ.fasta', 'fasta')
infile = open('/home/kika/ownCloud/euglenophytes/OGs/in')
out = open('/home/kika/ownCloud/euglenophytes/OGs/EL_missing_hits.fa', 'w')

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
