#!/bin/bash

cd /storage/brno3-cerit/home/kika/prototheca/zopfii/

files=*trimmed*.fq.gz

for file in $files; do
	echo $file
	first=${file/trimmed/trimmed_renamed%.gz}
	# sed 's/_trimmed/_trimmed_renamed/' $file
	# new=${file%.fq.gz}_renamed.fq
	echo $first
done	
# sed -E 's/(@.*)\/([[:digit:]]).*/\1_\2/' SRR8447029_1.fastq > SRR8447029_renamed_1.fastq
# SRR8447029_trimmed_1.fq.gz 
# SRR8447029_trimmed_renamed_1.fq
# aln=${f%.mafft.aln}.trimal_0.5.aln