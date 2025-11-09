sample="HEK293T.Ctl.Rep1 HEK293T.Ctl.Rep2 HEK293T.NES.Rep1 HEK293T.NES.Rep2"
for s in $sample
do
#samtools view -H $s.hisat2.bam > $s.head

#samtools view -F 3332 $s.hisat2.bam -@ 8 | grep NH:i:1 |cat $s.head -|samtools view -Sb -f 2 - |samtools sort - -o $s.uniq.bam -@ 8
:<<!
java -jar ~/Data/Ubin/picard.jar AddOrReplaceReadGroups \
I=$s.uniq.bam \
O=$s.uniq.rg.bam \
RGID=$s \
RGLB=lib1 \
RGPL=ILLUMINA \
RGPU=unit1 \
RGSM=$s \
CREATE_INDEX=true
#samtools index $s.uniq.bam -@ 8
java -jar ~/Data/Ubin/picard.jar MarkDuplicates INPUT=${s}.uniq.rg.bam OUTPUT=${s}.uniq.nodup.bam METRICS_FILE=${s}.dup ASSUME_SORTED=TRUE REMOVE_DUPLICATES=true
!
samtools index $s.uniq.nodup.bam -@ 8

done
