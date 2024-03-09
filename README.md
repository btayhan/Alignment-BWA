# Alignment-BWA

- Spaced-seed indexing tools are described as slower and more memory-intensive but are effective at mapping long gaps in sequences. This approach uses patterns (or "seeds") with specific spaces to identify possible alignments before performing a more detailed comparison.
![Sequence_Alignment_Example](https://github.com/btayhan/Alignment-BWA/assets/144340455/398261af-e2d0-4bee-a5e8-bc9aa8be793e)

- Burrows–Wheeler Transform (BWT)-based tools, on the other hand, are faster, use less memory, and are suitable for mapping short reads. BWT is a data transformation technique that rearranges the characters in a string into runs of similar characters, making it more efficient for certain types of data compression and indexing.

Choice of alignment tool may also be determined by the type of NGS application being conducted. 
- STAR is for RNA-seq data because it is fast and optimized for aligning spliced reads.
- For ChIP-Seq Bowtie2 is very popular to align the reads because it is fast and accurate.
- For variant calling BWA (Burrows-Wheeler Aligner) is widely used for alignment.

BWA is generally slower than Bowtie2 with similar sensitivity and both tools can perform gapped alignment for the identification of indels and can effectively map paired-end reads. However, BWA is a bit more accurate and provides information on which alignments are trustworthy. Small numbers of bad alignments can result in many false variant calls, so accuracy is paramount, and is the basis for choosing BWA.



Many algorithms have been developed  
BWA and Bowtie2 are index-based aligners exploiting Burrows–Wheeler indexing algorithm. 
NovoAlign uses dynamic programming, taking advantage of Needleman–Wunsch algorithm with affine gap penalties to score the alignment. 



### Burrows-Wheeler Transform
![bwt](https://github.com/btayhan/Alignment-BWA/assets/144340455/f02ebee7-4d5d-4396-a4b4-5746c567904d)


### Burrows-Wheeler Aligner (BWA) 

Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. Depending on read length, BWA modes can be chatagorized as:

- BWA-backtrack: designed for Illumina sequence reads up to 100bp

- BWA-SW: designed for longer sequences ranging from 70bp to 1Mbp, long-read support and split alignment

- BWA-MEM: shares similar features to BWA-SW, but BWA-MEM is the latest, and is generally recommended for high-quality queries as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads.

## Yess, we passed the boring parts!! Congrats 🍻


##  Lets begin with Files


### BWA outputs alignment in the SAM format to take the advantage of the downstream analyses implemented in SAMtools.

- samtools is the name of the suite of tools.
- view is the specific command to view or convert alignment files.
- `-b` is an option that specifies the output to be BAM format. If the input file is already in BAM format and you run the command with the `-b` flag, it will simply output a BAM formatted file again, which can be redundant unless paired with other options for filtering.

#### For downstream analysis, some 

### Visualization with IGV
The Integrative Genomics Viewer (IGV) is a high-performance, easy-to-use, interactive tool for the visual exploration of genomic data. It supports flexible integration of all the common types of genomic data and metadata, investigator-generated or publicly available, loaded from local or cloud sources.

To Download IGV to Cluster:

```
wget https://data.broadinstitute.org/igv/projects/downloads/2.17/IGV_Linux_2.17.3_WithJava.zip

```
Then unzip the file:

```
unzip IGV_Linux_2.17.3_WithJava.zip

```



