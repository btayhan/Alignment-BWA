#!/bin/bash
#SBATCH --job-name=fastQC
#SBATCH --nodes=1
#SBATCH --account=users
#SBATCH --qos=short_mdbf
#SBATCH --partition=short_mdbf
#SBATCH --cpus-per-task=1
#SBATCH -o %x-%j-slurm.out
#SBATCH -e %x-%j-slurm.err

# Load samtools module

module load samtools-1.9-gcc-9.2.0-w7pulwi


# This script converts SAM file into the BAM file (because BAM file is quitely small compare to SAM file)

samtools sort -o sorted.bam output.bam