#!/bin/bash
#SBATCH --job-name=example.SBATCH --output=Scenario3
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
EC-12_R1_001.fastq.gz \
EC-12_R2_001.fastq.gz \
S3_output_R1_pairedend.fq.gz S3_output_R1_singleend.fq.gz \
S3_output_R2_pairedend.fq.gz S3_output_R2_singleend.fq.gz \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

#-----------------------Unload-Module-------------------------#
module unload Trimmomatic

#---------------------------Finish----------------------------#
