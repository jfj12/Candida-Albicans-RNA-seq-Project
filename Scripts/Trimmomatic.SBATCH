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

#----------------------Define-Variables-----------------------#

Adapters=/home/jfj12/TruSeq3-PE.fa

Input_R1=/home/jfj12/WTC1_1.fq.gz
Input_R2=/home/jfj12/WTC1_2.fq.gz

Output_R1_PE=/home/jfj12/WTC1_1_trPE.fq.gz
Output_R1_SE=/home/jfj12/WTC1_1_trSE.fq.gz

Output_R2_PE=/home/jfj12/WTC1_2_trPE.fq.gz
Output_R2_SE=/home/jfj12/WTC1_2_trSE.fq.gz

#-------------------------RUN-command-------------------------#

trimmomatic PE \
$Input_R1 \
$Input_R2 \
$Output_R1_PE $Output_R1_SE \
$Output_R2_PE $Output_R2_SE \
ILLUMINACLIP:$Adapters:2:30:10 \
HEADCROP:20 \
TRAILING:20 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#-----------------------Unload-Module-------------------------#

module unload Trimmomatic
