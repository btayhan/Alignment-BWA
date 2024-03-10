# Alignment-BWA

## Theoretical Part: 

![14bm](https://github.com/btayhan/Alignment-BWA/assets/144340455/175f0314-1a9d-4ad5-9c11-bb2e1c6bb2a8)

With the advent of next-generation DNA sequencing technologies, the volume of sequence data has increased exponentially. Mapping this vast quantity of sequencing reads to large genomes presents significant challenges to existing sequence alignment programs [1]. These challenges stem not only from the sheer volume of data but also from the complexity of the genomic landscape, including variations and repetitive sequences [1]. To address the need for both efficient and accurate read mapping, numerous new alignment programs have been developed [1][2]. These tools employ advanced computational algorithms to meet the dual demands of speed and precision, which are crucial for analyzing sequencing data and extracting meaningful biological insights [2]. The common alignment tools are based on (1) spaced-seed indexing or (2) Burrows–Wheeler transform: 

- Spaced-seed indexing tools are described as slower and more memory-intensive but are effective at mapping long gaps in sequences. This approach uses patterns (or "seeds") with specific spaces to identify possible alignments before performing a more detailed comparison[2].
![Sequence_Alignment_Example](https://github.com/btayhan/Alignment-BWA/assets/144340455/398261af-e2d0-4bee-a5e8-bc9aa8be793e)

Figure 1. Spaced-seed indexing

<details>

<summary>For detailed information about Spaced-seed indexing clich here!!! </summary>

Spaced seeds have been used in homology search, alignment, assembly and metagenomics.It is a powerful concept for detecting sequence similarity while allowing for certain mismatches, which are common in biological sequences due to mutations, evolutionary divergences, or sequencing errors. Let's delve into the details of your example:

DNA Sequences:
Sequence 1: CTAAGTCACG
Sequence 2: CTAACACACG
Spaced Seed Pattern:
Pattern: 1111001111

The spaced seed pattern is represented as a sequence of zeroes and ones, where "1" indicates a position of relevance (i.e., a position that must match for the seed to consider the sequences as similar at that spot) and "0" indicates irrelevance. Upon visual inspection, it's easy to see that there is a mismatch between the two sequences at the fifth and six base positions (in bold, above). However, the sequences still share 80% sequence similarity.

</details>

- Burrows–Wheeler Transform (BWT)-based tools, on the other hand, are faster, use less memory, and are suitable for mapping short reads[2]. BWT is a data transformation technique that rearranges the characters in a string into runs of similar characters, making it more efficient for certain types of data compression and indexing. BWA and Bowtie2 are index-based aligners exploiting Burrows–Wheeler indexing algorithm[3].

   ![bwt](https://github.com/btayhan/Alignment-BWA/assets/144340455/1496d2cd-518b-45e8-a9ec-37942c512078)

Figure 2. Schematic summary of Burrows–Wheeler Transform

<details>

<summary>For detailed information about BWT clich here!!! </summary>

![suffix](https://github.com/btayhan/Alignment-BWA/assets/144340455/a156ab94-cb52-40c5-9ddc-3fd380ef4e73)


The BWT is generated by taking the last column of the lexicographically sorted rotations of the word.The suffix array indicates the starting positions of the sorted rotations in the original word.

For the word "catch," the Burrows-Wheeler Transform (BWT) is 'cht$ca', and the corresponding suffix array is [2,6,4,1,3,5].

![reconstruction](https://github.com/btayhan/Alignment-BWA/assets/144340455/0ff1622e-d4f7-42d1-ab24-739aa54cd705)


</details>


The choice of an alignment tool in next-generation sequencing (NGS) applications is critical and depends on the specific requirements of the dataset and the goals of the research[4]. Different alignment tools are optimized for different types of data and analyses. Here's an expanded explanation of why certain tools are preferred for specific NGS applications:

#### Considerations for Tool Selection
- Data Type and Quality: The nature of the NGS data (e.g., read length, quality, and type of sequencing) can influence which aligner will provide the best results[1].
- Analysis Goals: The specific objectives of the study, such as identifying splice variants, protein-DNA interactions, or genetic variants, guide the choice of the most appropriate alignment tool[2].
- Computational Resources: The availability of computational power and memory can also dictate the choice of tools, as some aligners require more computational resources than others.

#### STAR for RNA-seq Data
- RNA-seq involves sequencing RNA to study gene expression, splicing patterns, and other transcriptomic features [5].
- STAR (Spliced Transcripts Alignment to a Reference) is designed to efficiently handle the complexities of RNA-seq data, such as splicing. It can rapidly align RNA-seq reads to a reference genome by recognizing exon-exon junctions, a common feature in mRNA sequences that results from splicing [5].
- Its speed and efficiency stem from an advanced algorithm that creates a highly optimized hash table of the reference genome, allowing for quick mapping of RNA sequences, including those that are spliced. This makes STAR particularly suitable for large-scale RNA-seq datasets [5].
#### Bowtie2 for ChIP-Seq
- ChIP-Seq (Chromatin Immunoprecipitation Sequencing) is used to analyze protein interactions with DNA. It identifies the binding sites of DNA-associated proteins[6].
- Bowtie2 is favored for ChIP-Seq because it combines speed with a flexible and sensitive alignment strategy. It is capable of aligning reads with mismatches, gaps, or clippings, which are important features for accurately mapping the short reads typical of ChIP-Seq datasets to a reference genome[6].
- Bowtie2 uses the Burrows–Wheeler Transform (BWT) for efficient memory usage, making it capable of handling the large datasets generated by ChIP-Seq experiments while still providing accurate alignments[6].
#### BWA for Variant Calling
- Variant calling involves identifying variations from a reference genome, such as SNPs (Single Nucleotide Polymorphisms), insertions, and deletions[3].
- BWA (Burrows-Wheeler Aligner) is widely used for its effectiveness in aligning sequencing reads (especially longer reads) to large reference genomes like the human genome[3]. This capability is crucial for variant calling, where precise alignment is necessary to accurately identify genomic variations.
- BWA's algorithms (such as BWA-MEM for longer reads) are designed to be fast and memory-efficient, enabling the processing of large genomic datasets required for comprehensive variant analysis. Its accuracy in mapping allows for reliable variant detection, making it a standard tool in many genomics workflows[3].

BWA is generally slower than Bowtie2 with similar sensitivity and both tools can perform gapped alignment for the identification of indels and can effectively map paired-end reads. However, BWA is a bit more accurate and provides information on which alignments are trustworthy. Small numbers of bad alignments can result in many false variant calls, so accuracy is paramount, and is the basis for choosing BWA[1][2].


### Burrows-Wheeler Aligner (BWA) 

Burrows-Wheeler Aligner (BWA) is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM[3]. Depending on read length, BWA modes can be catagorized as:

| Modes |                            Applications                                      |
|------:|-----------------------------------------------------------------------------|
| BWA-backtrack| Designed for Illumina sequence reads up to 100bp|
|BWA-SW| Designed for longer sequences ranging from 70bp to 1Mbp, long-read support and split alignment                          |
|BWA-MEM|  Shares similar features to BWA-SW, but BWA-MEM is the latest, and is generally recommended for high-quality queries as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads.|


## Yess, we passed the boring parts!! Congrats 🍻
![PhY](https://github.com/btayhan/Alignment-BWA/assets/144340455/9a9463df-e82f-40ef-8b51-20fe6e3b7eae)


##  Let's begin with files first

<details>

<summary>If you want to look at source data: </summary>

- Mycobacterium ulcerans Agy99, complete genome:
  
https://www.ncbi.nlm.nih.gov/nuccore/CP000325.1

-  Whole genome sequence of Mycobacterium ulcerans
  
https://trace.ncbi.nlm.nih.gov/Traces/index.html?view=run_browser&acc=ERR3335404&display=metadata

</details>

Reference file is already created in index file/directory. Let's download FASTQ files with the following command: 

```
download_fastq.sh
```
## Preprocessing
Before aligning sequencing reads to a reference genome, the genome must be processed into a format that allows for rapid searches. bwa index performs this preprocessing step. In this stage, bwa_index.sh should be run:

```
bwa_index.sh
```
- .fasta: This is your original FASTA file containing the reference genome sequence.

- .amb: This file contains information about the ambiguous bases in the reference. Ambiguous bases are those that are not A, T, C, or G (the standard nucleotides). It stores the counts and positions of such occurrences.

- .ann: The .ann file holds the annotation data for the reference genome. It includes information like the length of the sequence and the names and comments associated with each of the sequences (or chromosomes) in the FASTA file.

- .bwt: The .bwt file is the Burrows-Wheeler Transform of the reference genome. This is the primary index that BWA uses to perform alignment. It allows BWA to efficiently handle alignments by performing complex pattern-matching algorithms.

- .pac: This file is the packed version of the original reference genome sequence. The sequence is converted into a 2-bit encoding format (with 4 possible nucleotides represented in 2 bits each), which reduces the file size and speeds up the alignment process.

- .sa: The suffix array file is used in conjunction with the BWT to locate the position of the reads in the reference genome. It's essentially a sorted array of all suffixes of the BWT. The SA file is critical for the backtracking steps during the alignment process when the BWT needs to be translated back into the actual sequence positions.


## Mapping
 For aligning sequencing reads:
 ```
bwa.sh
```
In the end of the day, `bwa mem` finds seed matches between the read and the reference sequence, then final alignments are output in SAM (Sequence Alignment/Map) format to take the advantage of the downstream analyses implemented in SAMtools.
SAM files should be converted to BAM (Binary Alignment/Map) format for more efficient storage and is used for subsequent analysis like variant calling.
#### To convert SAM file into the BAM format:
```
samtools.sh
```
- samtools is the name of the suite of tools.
- view is the specific command to view or convert alignment files.
- `-b` is an option that specifies the output to be BAM format. If the input file is already in BAM format and you run the command with the `-b` flag, it will simply output a BAM formatted file again, which can be redundant unless paired with other options for filtering.

#### Sorting is typically required for downstream analyses, such as variant calling or visualization.
For this transition, `samtools sort` is used.
How `samtools sort`  Works:
- Reads the SAM/BAM input, either from a file or streamed directly from another process.
- Organizes the alignments by genomic coordinates or by read name.
- Outputs a sorted SAM/BAM file, which can optionally be written directly to a compressed BAM file.
```
  samtools_sort.sh
```
Many downstream tools, such as those used for variant calling, require indexed files to function properly or to significantly improve their performance. For this reason, it is required to index the BAM file:


### Visualization with Samtools
For command-line visualization, samtools tview is a text-based viewer for sequence alignments in SAM/BAM format. While not as visually comprehensive as graphical tools, tview can be useful for quick checks and is easily run on a cluster. Run samtools tview directly on the cluster via a terminal:
```
module load samtools-1.9-gcc-9.2.0-w7pulwi
samtools tview sorted.bam index/Agy99.fasta
```

Here is an example output:
```
ref:  AGCTTAGGCTAGCTTAGGCTAGCTT...
      |||||||||||||||||||||||||...
read1:AGCTTAGGCTAGCTTAGG--AGCTT...
read2:   CTTAGGCTAGCTTAGGCTAGC...
read3:AGCTTAGGCTAGCTTA--GCTAGCTT...
```
- ref: indicates the reference sequence.
- The lines below ref: represent individual reads from your BAM file aligned against the reference.
- | (pipes) below the reference sequence indicate positions where the read sequence matches the reference sequence.
- Gaps in the alignment are represented by - (dashes) in the reads, indicating insertions or deletions relative to the reference.
- If a read contains mismatches (variations compared to the reference), the specific nucleotide(s) will be shown in place of the | symbol at that position.

### Visualization with IGV
The Integrative Genomics Viewer (IGV) is a high-performance, easy-to-use, interactive tool for the visual exploration of genomic data. It supports flexible integration of all the common types of genomic data and metadata, investigator-generated or publicly available, loaded from local or cloud sources.

#### To Download IGV to Cluster:

```
wget https://data.broadinstitute.org/igv/projects/downloads/2.17/IGV_Linux_2.17.3_WithJava.zip

```
Then unzip the file:

```
unzip IGV_Linux_2.17.3_WithJava.zip

```
This part is required to add this program into user's path:
```
unzip IGV_Linux_2.17.3_WithJava.zip

```

#### We should add this program into our path to compute everywhere basically:

In your home directory:
```
mkdir app
mv IGV_Linux_2.17.3
cd app/IGV_Linux_2.17.3
pwd
```
Copy your pathway(It is possible to look like that):
```
/cta/users/btayhan/apps/IGV_Linux_2.17.3
```
Then it is recommended to create a backup of your .bashrc file:
```
cp .bahsrc bahsrc.bak
```
Then go to your .bahsrc file (with vi, nano, up to you):
```
nano .bahsrc
```

go to the end and write `export PATH=$PATH:` add your path. Here is an example:

```
export PATH=$PATH:/cta/users/btayhan/apps/IGV_Linux_2.17.3
```
## Now we passed the technical part!! Showtime?
Now, we can go back to our file (6_alignment) and write:
```
igv.sh
```
Wait a bit...
### Here Are the results:

![igv](https://github.com/btayhan/Alignment-BWA/assets/144340455/07798e0f-c6a5-44ad-95e8-5ef0a5042272)


![igv2](https://github.com/btayhan/Alignment-BWA/assets/144340455/d7b20154-da03-4180-9c01-683c21f5ee40)

For more information about IGV please click:
https://www.youtube.com/watch?v=woKXw1R8LMA&ab_channel=BioinformaticsDotCa


### References
[1]	L. Donato, C. Scimone, C. Rinaldi, R. D’Angelo, and A. Sidoti, “New evaluation methods of read mapping by 17 aligners on simulated and empirical NGS data: an updated comparison of DNA- and RNA-Seq data from Illumina and Ion Torrent technologies,” Neural Comput Appl, vol. 33, no. 22, p. 15669, Nov. 2021, doi: 10.1007/S00521-021-06188-Z.
[2]	S. Schaarschmidt, A. Fischer, E. Zuther, and D. K. Hincha, “Evaluation of Seven Different RNA-Seq Alignment Tools Based on Experimental Data from the Model Plant Arabidopsis thaliana,” Int J Mol Sci, vol. 21, no. 5, Mar. 2020, doi: 10.3390/IJMS21051720.
[3]	H. Li and R. Durbin, “Fast and accurate short read alignment with Burrows–Wheeler transform,” Bioinformatics, vol. 25, no. 14, p. 1754, Jul. 2009, doi: 10.1093/BIOINFORMATICS/BTP324.
[4]	R. Musich, L. Cadle-Davidson, and M. V. Osier, “Comparison of Short-Read Sequence Aligners Indicates Strengths and Weaknesses for Biologists to Consider,” Front Plant Sci, vol. 12, p. 657240, Apr. 2021, doi: 10.3389/FPLS.2021.657240/BIBTEX.
[5]	A. Dobin et al., “STAR: ultrafast universal RNA-seq aligner,” Bioinformatics, vol. 29, no. 1, p. 15, Jan. 2013, doi: 10.1093/BIOINFORMATICS/BTS635.
[6]	B. Langmead and S. L. Salzberg, “Fast gapped-read alignment with Bowtie 2,” Nat Methods, vol. 9, no. 4, p. 357, Apr. 2012, doi: 10.1038/NMETH.1923.

https://www.youtube.com/watch?v=woKXw1R8LMA&ab_channel=BioinformaticsDotCa
https://www.youtube.com/watch?v=1wcFavYt6uU&ab_channel=BioinformaticsCoach



