mkdir -p /Users/lixia/Data/data/TAS_seq/STAR
#Genome=GRCh38.NCBI
Genomedir=/Users/lixia/Data/database/ref_genome/GRCh38.NCBI/GRCh38.satr.index
cd /Users/lixia/Data/data/TAS_seq/fastq

sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"

for s in $sample
do
STAR \
--runThreadN 8 \
--outFilterMultimapNmax 20 \
--outFileNamePrefix ./STAR/$s.STAR \
--genomeDir $Genomedir/ \
--outSAMtype BAM Unsorted \
--readFilesCommand gzcat \
--readFilesIn $s.1.fastq.gz $s.2.fastq.gz \
--alignEndsType EndToEnd \
--outReadsUnmapped Fastx 2 \
--outSAMstrandField intronMotif \
--outFilterMismatchNmax 20
done
