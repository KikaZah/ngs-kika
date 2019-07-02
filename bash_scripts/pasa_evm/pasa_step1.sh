#!/bin/bash

pasa_path='/opt/pasa/current/scripts/'

#genome file
genome=/home/kika/pelomyxa_schiedti/genome_assembly/pelomyxa_final_genome.fa
#transcriptome file
transcriptome=/home/kika/pelomyxa_schiedti/transcriptome_assembly/pelomyxa_transcriptome_clean.fa

#database name for mysql
database='/home/kika/pelomyxa_schiedti/pasa/pelomyxa_pasa_mysql'
pasa_fasta=$database'.assemblies.fasta'
pasa_gff=$database'.pasa_assemblies.gff3'
config='/home/kika/pelomyxa_schiedti/pasa/alignAssembly.config'

## run pasa 
$pasa_path'Launch_PASA_pipeline.pl' -c $config -C -r -R -g $genome -t $transcriptome --CPU 15 \
--ALIGNERS blat,gmap --TRANSDECODER --MAX_INTRON_LENGTH 2000
##generate the assemblies of pasa
$pasa_path'pasa_asmbls_to_training_set.dbi' --pasa_transcripts_fasta $pasa_fasta --pasa_transcripts_gff3 $pasa_gff
