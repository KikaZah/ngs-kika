#!/usr/bin/python3
from collections import OrderedDict
from collections import defaultdict
from Bio import SeqIO

infile = SeqIO.parse('/home/kika/MEGAsync/Euglena_longa/2013_Sekvenovanie/import/TOC-TIC/tic62_tree/eg_seqs.txt', 'fasta')
out_fasta = open('/home/kika/MEGAsync/Euglena_longa/2013_Sekvenovanie/import/TOC-TIC/tic62_tree/eg_seqs_dedupl.txt', 'w')
out_names = open('/home/kika/MEGAsync/Euglena_longa/2013_Sekvenovanie/import/TOC-TIC/tic62_tree/eg_dupl-names.txt', 'w')

multiplications = defaultdict(list)
seq_dict = OrderedDict()
for sequence in infile:
    multiplications[sequence.seq].append(sequence.description)
    if sequence.seq not in seq_dict:
    	#rename full header only with name (acc, till the first space)
        # seq_dict[sequence.seq] = sequence.name 
        #keep full header			
        seq_dict[sequence.seq] = sequence.description

for key, value in seq_dict.items():
    out_fasta.write('>{}\n{}\n'.format(value, key))

for key, value in multiplications.items():
    if len(value) > 1:
        out_names.write('{}\n'.format(str(value)))

out_fasta.close()
out_names.close()