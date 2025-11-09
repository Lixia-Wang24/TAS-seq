Genome=GRCh38
Genomedir=/Users/lixia/Data/database/ref_genome/GRCh38.NCBI
mkdir -p DEseq2

sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"
for s in $sample
do
htseq-count -f bam -r name -m intersection-nonempty -s reverse $s.uniq.nodup.bam -i gene_id -t exon $Genomedir/$Genome.gtf 1>./DEseq2/$s.uniq.exp 2>./DEseq2/$s.uniq.err

#########去除 gene 注释不清的count值################
grep __ -v ./DEseq2/$s.uniq.exp > ./DEseq2/$s.uniq.clean.exp

##########合并 count 文件###################
cd ./DEseq2

echo -en "gene\tHEK293T.NES.Rep1\tHEK293T.Ctl.Rep1\tHEK293T.NES.Rep2\tHEK293T.Ctl.Rep2\n" > test.count
paste HEK293T.NES.Rep1.uniq.clean.exp HEK293T.Ctl.Rep1.uniq.clean.exp HEK293T.NES.Rep2.uniq.clean.exp HEK293T.Ctl.Rep2.uniq.clean.exp | cut -f1,2,4,6,8 >> test.count

##########R 做DEseq2差异分析###########
# Please check the R script(s) starting with "GeneExpressionDiff" in the "Other-R-code" repository.
