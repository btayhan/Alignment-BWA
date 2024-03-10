#!/bin/bash
#SBATCH --job-name=download
#SBATCH --nodes=1
#SBATCH --account=users
#SBATCH --qos=short_mdbf
#SBATCH --partition=short_mdbf
#SBATCH --cpus-per-task=1
#SBATCH -o %x-%j-slurm.out
#SBATCH -e %x-%j-slurm.err

# Load BWA module

module load bwa-0.7.17-gcc-9.2.0-xwkclqy

# Index the reference file

bwa index index/Agy99.fasta
