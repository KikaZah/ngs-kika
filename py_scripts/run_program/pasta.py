#!/usr/bin/python3
import os

os.chdir('/home/kika/MEGAsync/blasto_project/genes/oxidative_stress/PASTA/')
files = os.listdir()

for file in files:
	if file.endswith('.fa'):
	# if '.aln' not in file:
		print(file)
		job_desc = file.split('.fa')[0]
		d = 'protein'
		os.system('run_pasta.py -i {} -d {} -j {}'.format(file, d, job_desc))