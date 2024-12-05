# Master Notes
## Goals
type goals here
## Experimental Design and Workflow
### Experimental Design
summary of experimental design
### Workflow
#### Preliminary Sequence Analysis
RNA from biologically-replicated _Candida albicans_ cultures grown in the presence of thiamine were extracted. A sequence library was prepared and ribosomal RNAs were removed 
before being sequenced. Sequencing produced the corresponding read pairs WTC1_.fq.gz and WTC1_2.fq.gz. Fastqc was conducted on the sequence reads and it was determined the 
sequences had poor per-base sequence quality, per-base sequence content, and poor sequence duplication levels. 
#### Read Cleaning
Trimmomatic was run with headcrop, trailing, slidingwindow:4:15, and minlen:75 parameters to clean the identified sequence errors. Post-cleaning resulted in 0.959% sequence
retention with improved per-base sequence quality and per-base sequence content while the sequence duplication remained poor quality.
#### Cleaned Sequence Alignment
Using Bowtie2/2.5.3, the cleaned sequences were set into four indexes and mapped to the _C albicans_ reference genome (GCF_000182965.3_ASM18296v3_genomic.fna available 
through NCBI).
#### Sequence Gene Counts
description of Htseq-count
#### Differential Expression Analysis
description of deseq2
#### Gene Ontology Integrative Analysis
description
####
## Results
__Table 1__: table caption
| Locus Tag | NCBI Gene ID | gtf Gene Name | Biological Process (Uniprot) | Molecular Function (Uniprot) | Cellular Component (Uniprot) |
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|CAALFM_C102590CA | 3636803 | SNZ1 | amino acid metabolism, pyridoxine biosynthesis, pyridoxal phosphate biosynthesis | amine lyase; pyridoxal 5'-phosphate synthase (glutamine hydrolyzing) | cytoplasm, fungal biofilm matrix|
| CAALFM_C102600WA | 3636812 | SNO1 | glutamine metabolism, pyridoxal phosphate biosynthesis, pyridoxine metabolism | glutaminase | cytoplasm, cytosol, glutaminase complex |
| CAALFM_C203370WA | 3637387 | THI20 | thiamine biosynthesis, phosphorylation  | transferase, hydroxymethyl pyrimidine kinase, phosphomethylpyrimidine kinase; Trifunctional hydroxymethyl pyrimidine kinase/phosphomethylpyrimidine kinase/thiaminase | cytosol |
| CAALFM_C204580WA | 3645440 | ERG20 | lipid biosynthesis, steroid biosynthesis; ergosterol biosynthesis, farnesyl diphosphate biosynthesis, geranyl diphosphate biosynthesis, isoprenoid | transferase, dimethylallyltranstransferase, geranyltranstransferase, metal ion binding; farnesyl pyrophosphate synthase | cytoplasm, fungal biofilm matrix |
| CAALFM_C302860WA | 3638333 | THI6 | thiamine biosynthesis; phosphorylation, thiamine diphosphate biosynthesis | kinase, transferase; ATP binding, hydroxyethyl thiazole kinase, magnesium ion binding, thiamine-phosphate diphosphorylase; bifunctional hydroxyethyl thiazole kinase/thiamine-phosphate diphosphorylase | cytoplasm, cytosol |
| CAALFM_C302870CA | 3638334 | N/A | amino acid transmembrane transport, cell-abiotic substrate adhesion | amino acid transporter transmembrane domain-containing protein | vacuolar membrane, transmembrane |
| CAALFM_C305130CA | 3635160 | THI4 | thiamine biosynthesis, thiazole biosynthesis | transferase; iron ion binding, pentosyltransferase; thiamine thiazole synthase | cytosol, fungal biofilm matrix, nucleus |
| CAALFM_C404220WA | 3646858 | DUO1 | cell cycle, cell division, chromosome partition, mitosis; filamentous growth, miotic spindle organization | DASH complex subunit | cytoplasm, DASH complex, mitotic spindle |
| CAALFM_C404230WA | 3646857 | N/A | N/A | transmembrane transporter; major facilitator superfamily (MFS) profile domain-containing protein | endoplasmic reticulum, membrane |
| CAALFM_C503480CA | 3646965 | DUR31 | transport; spermidine transport, cellular response to metal ion, cellular response to starvation, filamentous growth, intracellular pH elevation, transmembrane transport | Spermidine transporter | plasma membrane |
| CAALFM_CR09290WA | 3641921 | THI13 | thiamine biosynthesis, thiamine diphosphate biosynthesis | transferase; metal ion binding, 4-amino-5-hydroxymethyl-2-methyl pyrimidine phosphate synthase | N/A |
| CAALFM_CR09350CA | 3641901 | N/A | thiamine metabolism | Thiaminase-2/PQQC domain-containing protein | cytosol |
| CAALFM_CR09360WA | 3641902 | FCY24 | transmembrane transport | transmembrane transporter | plasma membrane |
## Analysis and Discussion
type analysis and biological interpretation here
