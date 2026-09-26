# Genomic Analysis of Antimicrobial Resistance in Gram-Negative Bacterial Pathogens Using Whole-Genome Sequencing

## Overview

This project investigates antimicrobial resistance (AMR) determinants in selected multidrug-resistant Gram-negative bacterial pathogens using whole-genome sequencing (WGS) data.

The computational analysis includes raw sequencing quality assessment, read preprocessing, de novo genome assembly, assembly quality assessment, AMR determinant identification, and comparative analysis of AMR profiles across selected isolates.

## Research Question

What antimicrobial resistance determinants are present in selected multidrug-resistant Gram-negative bacterial pathogens, and how do their genomic resistance profiles differ between pathogens?

## Aim

To identify and comparatively analyse antimicrobial resistance determinants in selected Gram-negative bacterial pathogens using whole-genome sequencing data.

## Objectives

1. Assess the quality of raw WGS reads.
2. Perform adapter and quality trimming of sequencing reads.
3. Evaluate post-trimming read quality.
4. Perform de novo genome assembly.
5. Assess assembly characteristics.
6. Identify antimicrobial resistance determinants using AMRFinderPlus.
7. Generate isolate-wise AMR determinant profiles.
8. Compare AMR determinants and AMR classes across selected isolates.
9. Evaluate the evidence quality of detected AMR determinants.
10. Visualize and interpret comparative AMR profiles.

## Dataset

The sequencing data were obtained from NCBI BioProject:

**BioProject:** PRJNA925003

Five Illumina paired-end WGS isolates were selected for the pilot analysis:

| Isolate | Species |
|---|---|
| SRR23106236 | Klebsiella pneumoniae |
| SRR23106237 | Klebsiella pneumoniae |
| SRR23106238 | Acinetobacter baumannii |
| SRR23106353 | Acinetobacter baumannii |
| SRR23106336 | Pseudomonas aeruginosa |

The five isolates represent a manageable subset of the larger BioProject and were selected to permit within- and between-pathogen comparison.

## Computational Workflow

```text
Raw paired-end FASTQ
        |
        v
      FastQC
        |
        v
      fastp
        |
        v
Post-trimming FastQC
        |
        v
   SPAdes assembly
        |
        v
Assembly assessment
        |
        v
   AMRFinderPlus
        |
        v
AMR determinant tables
        |
        v
Python/R comparative analysis
        |
        v
Heatmaps, class distributions,
shared/unique determinants and
Jaccard similarity