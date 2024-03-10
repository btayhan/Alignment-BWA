#!/bin/bash
#SBATCH --job-name=fastQC
#SBATCH --nodes=1
#SBATCH --account=users
#SBATCH --qos=short_mdbf
#SBATCH --partition=short_mdbf
#SBATCH --cpus-per-task=8
#SBATCH -o %x-%j-slurm.out
#SBATCH -e %x-%j-slurm.err

# Load BWA module

module load bwa-0.7.17-gcc-9.2.0-xwkclqy


# Run FastQC on .fastq files in input directory and write output to output directory
bwa mem -t 8 index/Agy99.fasta P7741_R1.fastq.gz P7741_R2.fastq.gz > output.sam

# -t: threads