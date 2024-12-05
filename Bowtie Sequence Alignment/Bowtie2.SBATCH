#!/bin/bash
#SBATCH --job-name=bwtie_align --output=bwtie_align_z01
#SBATCH --mail-type=END,FAIL --mail-user=jfj12@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#---------------------Script-Description----------------------#
# Runs bowtie2 on paired end fastq files and directs          #
#                                                             #

#-----------------------set-environment-----------------------#

module load bowtie2/2.5.3

#----------------------Define-Variables-----------------------#

calb_idx=/home/jfj12/calb_idx

FPE_reads=/home/jfj12/WTC1_posttrim/WTC1_1_trPE.fq

RPE_reads=/home/jfj12/WTC1_posttrim/WTC1_2_trPE.fq

Output=/home/jfj12/WTC1.sam

#-------------------------RUN-command-------------------------#

bowtie2 -x $calb_idx \
-1 $FPE_reads \
-2 $RPE_reads \
-S $Output

#-----------------------Unload-Module-------------------------#

module unload bowtie2
