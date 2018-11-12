#!/bin/bash

read_dir='/media/4TB1/diplonema/reads/genome/used/'
name='1618_'
merged=$read_dir$name'merged.fq'
deduplicated=$read_dir$name'merged_deduplicated.fq'
report=$read_dir$name'report_dedupe_merged.txt'

/home/kika/tools/bbmap/dedupe.sh in=$merged out=$deduplicated k=31 ac=f 2> $report


merged=$read_dir$name'unmerged.fq'
deduplicated=$read_dir$name'unmerged_deduplicated.fq'
report=$read_dir$name'report_dedupe_unmerged.txt'

/home/kika/tools/bbmap/dedupe.sh in=$merged out=$deduplicated k=31 ac=f 2> $report
