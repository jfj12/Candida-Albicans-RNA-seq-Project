# Master Notes
## Goals
The primary goal of this project is to uncover the gene expression profile of thiamine metabolism in _Candida albicans_ (_C. albicans_) as it relates to virulence through hyphae formation using RNA sequencing under thiamine starvation conditions.
## Experimental Design and Workflow
### Preliminary Sequence Analysis
RNA from biologically-replicated _C. albicans_ cultures grown in the presence of thiamine were extracted. A sequencing library was prepared and ribosomal RNAs were removed 
before being sequenced. Sequencing produced the corresponding read pairs WTC1_1.fq and WTC1_2.fq ([Sequence Data/Precleaned Sequences](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/blob/main/Sequence%20Data/Pre-cleaned%20Sequences.md)). Fastqc was conducted on a compute node sequence and determined the sequences had poor per-base sequence quality, per-base sequence content, and poor sequence duplication levels. 
### Read Cleaning
Trimmomatic was run using the Trimmomatic.SBATCH [Script](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/tree/main/Scripts) with headcrop, trailing, slidingwindow:4:15, and minlen:75 parameters to clean the identified sequence errors. Post-cleaning resulted in 0.959% sequence retention with improved per-base sequence quality and per-base sequence content. In contrast, the sequence duplication remained poor quality ([Read clean spreadsheet link](https://docs.google.com/spreadsheets/d/1AOa-XaTzR_PKMIRQDmu8oDTmawXXnkIwEjKOQkNC7Vs/edit?gid=0#gid=0)). Single-end data was removed from the data pool while paired-end data was selected as the projects primary sequence. 
| File Name | # Preclean Reads | # Postclean Reads | Retention % | Postclean per-base sequence quality | Preclean per-base sequence content | Postclean per-base sequence content | Preclean sequence duplication | Postclean sequence duplication | Postclean adapter contamination |
| ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ | ------ |
| WTC1_1.fq.gz | 20752795 | 19901616 | 0.95898485 | G | B | G | B | B | None |
| WTC1_2.fq.gz | 20752795 | 19901616 | 0.95898485 | G | B | G | B | B | None |
### Cleaned Sequence Alignment
Using Bowtie2/2.5.3, the cleaned sequences were set into four indexes and mapped to the _C albicans_ reference genome using the Bowtie2.SBATCH script in [Scripts](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/tree/main/Scripts). (GCF_000182965.3_ASM18296v3_genomic.fna available through NCBI).[Alignment summary spreadsheet](https://docs.google.com/spreadsheets/d/1fa-FXVMlCXOZkbHSx_mMg0OXLMy9BeBJg8uWrEMpKGo/edit?gid=0#gid=0)
| Alignment File | # Cleaned reads after trimmomatic | # Read pairs detected by bowtie2 | % Aligned concordantly exactly 1 time | % Aligned concordantly >1 time | Overall alignment rate |
| ----- | ----- | ----- | ----- | ----- | ----- |
| WTC1.sam | 19901616 | 19901616 | 89.07% | 6.06% | 98.29% |
### Sequence Gene Counts
Sequence alignment maps (.sam) to the _C. albicans_ gtf [reference sequence](https://github.com/jfj12/Candida-Albicans-RNA-seqProject/blob/main/Sequence%20Data/Reference%20Sequence.md) were created using Bowtie2. Index sequences were first created and are present in [Indexes.md](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/blob/main/Bowtie%20Sequence%20Alignment/Indexes.md) under the [Bowtie Sequence Alignment folder](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/tree/main/Bowtie%20Sequence%20Alignment). After index creation, samtools was used on the compute node to convert the alignment map into a sorted (.srt) binary format (.bam) outputs in the [Bowtie Sequence Alignment folder](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/blob/main/Bowtie%20Sequence%20Alignment/Output%20Files.md). After alignment file sorting and format conversion, the maps were run through the htseq-count.SBATCH [script](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/tree/main/Scripts). 
### Differential Expression Analysis
Differential expression analysis was conducted using the deseq2 R [Script](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/tree/main/Scripts). Deseq2 utilized the six htseq-count output files ([Gene Counts /htseq-count inputs.md](https://github.com/jfj12/Candida-Albicans-RNA-seq-Project/tree/main/Gene%20Counts)) to make a database of differential expression data that was filtered for the gene occurrence greater than 10 reads across all created samples/libraries in thiamine present and absent conditions. Deseq2 produced a PCA and volcano plots to measure gene expression variance in the presence and absence of thiamine.
### Gene Ontology Integrative Analysis
Uniprot searches were conducted to determine ontological information about the potential biological function of the derived sequences to produce the summary table. 
###
## Results
[__Table 1__](https://docs.google.com/spreadsheets/d/1Tri4uQrTrm4q5R-wuuJnm1LEDS5FAGOOAoEysvvmlHY/edit?gid=1290215029#gid=1290215029): __Summary table of significant differentially expressed genes.__ Description 
| Locus tag | NCBI gene ID | gtf Gene name | Biological process (Uniprot) | Molecular function (Uniprot) | Cellular component (Uniprot) |
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

![TH-vTH+_pcaplot](https://github.com/user-attachments/assets/8abe3bd9-8698-4a2f-8ad4-48469039c4da)__Figure 1__: __PCA plot for significant differentially expressed genes.__ Both axes depict principle components that capture different levels of expression variance. The x-axis, PC1, accounts for the greatest amount of variance between gene expression while the y-axis, PC2, captures a second, more refined degree of variance. In this case, PC1 accounts for 88% of the overall variance while PC2 accounts for 9% of the variance. 

![R_volcano_plot_correct](https://github.com/user-attachments/assets/7f52949b-76cb-469f-80e8-3f094ada3e1a)

__Figure 2__: __Volcano plot for significant differentially expressed genes.__ Log2 fold change is depicted on the x-axis to represent up-regulation for positively located clusters and down-regulation for negatively located clusters. Negative log10 of the P-value of 0.05 is represented on the y-axis to represent statistical significance. Three clusters are identified in both the thiamine present and thiamine absent groups.
## Analysis and Discussion
### PCA Plot
Six distinct clusters are identified, three corresponding to both the thiamine present and thiamine absent groups, indicating six primary genetic mechanisms involved with thiamine metabolism.   
### Volcano Plot
Thirteen genes experienced increased expression in response to thiamine starvation. 
### Gene Ontology
In tandem with the principal component and volcano analysis, composite sequence data yielded thirteen significant differentially up-regulated genes. Five of the identified genes are related to thiamine biosynthesis and transferase activity while four were identified as transporters. The remaining genes had other functions not directly associated with thiamine metabolism such as amino acid and lipid metabolism and cell cycle maintenance. The primary location of these biological functions is found in the cytoplasm or cytosol.  
## Conclusion
Of the identified up-regulated genes, thiamine biosynthesis is the primary molecular mechanism, suggesting increased thiamine biosynthesis under starvation conditions. 
