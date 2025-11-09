#!/bin/bash
Genomedir=/Users/lixia/Data/database/ref_genome/GRCh38.NCBI/hisat2_idx/GRCh38_idx
#Genomedir=/Users/lixia/Data/database/ref_genome/GRCh38.NCBI/hisat2_idxi

sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"
for s in $sample
do
hisat2 -x $Genomedir -k 2 -p 8  --rna-strandness RF --dta -1 $s.1.fastq.clippper.gz -2 $s.2.fastq.clippper.gz --no-unal --un-conc-gz $s.hisat2.un.gz --no-softclip --summary-file $s.hisat2.log| tee >(samtools flagstat - > $s.hisat2.flagstat) | samtools sort -O BAM | tee $s.hisat2.bam
done
