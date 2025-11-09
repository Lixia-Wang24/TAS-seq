# TAS-seq (TAS-seq enables subcellular single-stranded adenosine profiling by signal peptide-assisted adenosine deamination)
# MOTIVATION
Understanding RNA structural dynamics across subcellular compartments and single-cell heterogeneity is essential for unraveling RNA regulatory mechanisms. 
Current in vivo RNA structure profiling methods primarily rely on chemical labeling and compartment isolation, but these approaches are limited by challenges such as the difficulty of purifying certain compartments, 
distinguishing specific substructures, and the inability to capture full-length subcellular RNA in single cells. To address these limitations, we developed TAS-seq using subcellularly localized deaminase TadA-8e 
to enzymatically label single-stranded adenosine in RNA, allowing the detection of substructure-dependent structural variations across compartments and subcellular RNA heterogeneity at the single-cell level. 
# SUMMARY
RNA structure plays a crucial role in its function and undergoes dynamic changes throughout its lifecycle. To study these dynamics, we developed TAS-seq, which expresses the deaminase TadA-8e in specific 
subcellular compartments to modify single-stranded adenosines, particularly within hairpin loops. We applied TAS-seq to the nucleus, cytosol, and endoplasmic reticulum membrane (ERM), identifying adenosine 
structural variations and compartment-specific regulation of RNA stability. scTAS-seq in single cells revealed structural heterogeneity of cytosolic RNAs. Additionally, adenosines labeled by TAS-seq contribute 
to gRNA optimization in the CRISPR/Cas13d system. Our method provides insights into compartment-specific RNA structural dynamics, cell-specific heterogeneity, and their functional implications.

# This scripts
The analysis script here includes the initial processing steps for TAS-seq data, covering data download, preprocessing, quality control (QC), and gene expression quantification.
