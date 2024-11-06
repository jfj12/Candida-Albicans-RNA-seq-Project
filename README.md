# RNA seq Project
## Project Primary Goal
To investigate differential gene expression and function of _Candida albicans_ in the presence and absence of thiamine. In other words, what pathways in _C albicans_ are 
affected or regulated by the presence or absence of thiamine? 
## Overview of Timeline and Methods
### 10/29/2024 - Preliminary Sequence Analysis
RNA from biologically-replicated _Candida albicans_ cultures grown in the presence of thiamine were extracted. A sequence library was prepared and ribosomal RNAs were removed 
before being sequenced. Sequencing produced the corresponding read pairs WTC1_.fq.gz and WTC1_2.fq.gz. Fastqc was conducted on the sequence reads and it was determined the 
sequences had poor per-base sequence quality, per-base sequence content, and poor sequence duplication levels. 
### 10/31/2024 - Read Cleaning
Trimmomatic was run with headcrop, trailing, slidingwindow:4:15, and minlen:75 parameters to clean the identified sequence errors. Post-cleaning resulted in 0.959% sequence
retention with improved per-base sequence quality and per-base sequence content while the sequence duplication remained poor quality.
### 11/05/2024 - Cleaned Sequence Alignment
Using Bowtie2/2.5.3, the cleaned sequences were set into four indexes and mapped to the _C albicans_ reference genome (GCF_000182965.3_ASM18296v3_genomic.fna available 
through NCBI). 
