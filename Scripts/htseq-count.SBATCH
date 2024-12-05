#!/bin/bash
#SBATCH --job-name=htseq-count --output=htseq-count.z01
#SBATCH --mail-type=END,FAIL --mail-user=jfj12@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#--------------------------------------------------------------#
#   This script uses htseq to count and assign reads to genes  #
#--------------------------------------------------------------#

source activate htseq

#- Set variables ---------------------------------------------------------#

htseq=/home/jfj12/.conda/envs/htseq/bin/htseq-count
bam=/home/jfj12/WTC1.srt.bam
ref=/home/jfj12/GCF_000182965.3_ASM18296v3_genomic.gtf
output=/home/jfj12/WTC1_htseq-count

#- RUN htseq-count -------------------------------------------------------#

${htseq} --format=bam \
--order=pos \
--stranded=no \
--type=exon \
--idattr=gene_id \
$bam \
$ref \
>$output
