#!/bin/bash
OUTPUT_DIR="/Users/lixia/data/data/TAS_seq/fastq"
mkdir -p $OUTPUT_DIR
sample="SRR30892944 SRR30892945 SRR30892946 SRR30892947"
for s in $sample
do
#fastq-dump --split-files --gzip -O $OUTPUT_DIR $s
#fasterq-dump -e 8 --split-files -O $OUTPUT_DIR $s
wait
done
cd fastq
gzip *.fastq
