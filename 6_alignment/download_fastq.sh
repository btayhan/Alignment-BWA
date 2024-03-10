#!/bin/bash
#SBATCH --job-name=download
#SBATCH --nodes=1
#SBATCH --account=users
#SBATCH --qos=short_mdbf
#SBATCH --partition=short_mdbf
#SBATCH --cpus-per-task=1
#SBATCH -o %x-%j-slurm.out
#SBATCH -e %x-%j-slurm.err


wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R1.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R2.fastq.gz

