#!/bin/bash
#SBATCH --job-name=RNAseq_10_31 --output=RNAseq.O
#SBATCH --mail-type=END,FAIL --mail-user=jfj12@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#---------------------Script-Description----------------------#
# Runs Trimmomatic on paired end fastq files and directs      #
# outputs to a sub directory "trim_out"                       #

#-----------------------set-environment-----------------------#

shopt -s expand_aliases
module load trimmomatic

#-------------------------RUN-command-------------------------#

trimmomatic PE \
WTC1_1.fq.gz \
WTC1_2.fq.gz \
WTC1_1_trPE.fq.gz WTC1_1_trSE.fq.gz \
WTC1_2_trPE.fq.gz  WTC1_2_trSE.fq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
HEADCROP:20 \
TRAILING:20 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#-----------------------Unload-Module-------------------------#

module unload Trimmomatic

#---------------------------Finish----------------------------#
