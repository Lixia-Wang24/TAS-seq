#!/bin/bash
:<<!

Samtools sort and index for data after Picard deduplication

sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"
for s in $sample
do
#samtools sort "$s".uniq.nodup.bam -o "$s".uniq.nodup.sorted.bam -@ 8
#samtools index "$s".uniq.nodup.sorted.bam -@ 8
done

Perform Transcript Assembly and Quantification using StringTie

#Ref_gtf="/Users/lixia/Data/database/ref_genome/GRCh38.GENCODE/gencode.v48.primary_assembly.annotation.gtf"

StringTie is compatible with ENSEMBL/GENCODE format GTF; the NCBI GTF file lacks a valid transcript_id and causes an error, modify NCBI GTF to GRCh38.fixed.s

Ref_gtf="/Users/lixia/Data/database/ref_genome/GRCh38.NCBI/GRCh38.filtered.gtf"
sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"
for s in $sample
do
    stringtie "$s".uniq.nodup.sorted.bam 

        -G "$Ref_gtf" 

        -o "$s".assembled.gtf 

        -p 8 

        --rf 

        -A "$s".gene.abundance.tsv

Create the merge list

ls *.assembled.gtf > mergelist.txt

Step 2: Merge

Ref_gtf="/Users/lixia/Data/database/ref_genome/GRCh38.NCBI/GRCh38.filtered.gtf"
stringtie --merge 

    -G "$Ref_gtf" 

    -o merged.transcripts.gtf 

    -i 

    -p 8 

    mergelist.txt

Step 3: Re-quantify

sample_parth="/Users/lixia/Data/data/TAS_seq/cutadaptor"
sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"
for s in $sample
do
    stringtie "$s".uniq.nodup.sorted.bam 

        -G merged.transcripts.gtf 

        -o "$s".quantified.gtf 

        -p 8 

        --rf 

        -A "$s".final_abundance.tsv 

        -e
done
!

Subsequent differential gene expression analysis can be performed with Ballgown

In Step 3 re-quantification, -B outputs Ballgown input files; but a separate folder is needed for each sample, otherwise only the -B file for the last sample will be kept.
