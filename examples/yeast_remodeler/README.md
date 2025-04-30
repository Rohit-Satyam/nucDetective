# Scripts to download all the required files and software used to run the nucDetective pipeline from scratch

## Requirements
*Docker (tested with v4.17.0)
*nextflow (tested with version 25.02.3-edge)
*Bowtie2 (tested with version 2.3.4.3)
*R (tested with version 4.4.1)
*R package stringr (tested with version 1.5.1)

## Content
* 00_master_script.sh: Contains the command to subsequently execute the scripts. To start, copy scripts into a new analysis folder and change the directory to the analysis folder. Once the required tools are installed the 00_master_script.sh can be executed to automate execution of the other scripts.
* 01_fetch_annotation.sh: downloads nucDetective pipeline, genome and gene annotation and generates bowtie2 index (Requirements: Bowtie2)
* 02_fetch_fastq.sh: downloads raw fastq files
* 03_createCSV_Profiler.R: creates input CSV file for Profiler workflow in nucDetective pipeline (Requirements: R and R packge stringr)
* 04_create_blacklist.R: creates file with blacklisted regions excluded from analysis (Requirements: R)
* 05_runNextflow_Profiler.sh: runs Profiler workflow in nucDetective pipeline (Requirements: nextflow and Docker)
* 06_createCSV_Inspector.R: creates input CSV file for Inspector workflow using the results of the Profiler workflow (Requirements: R and R packge stringr)
* 07_runNextflow_Inspector.sh: runs Inspector workflow in nucDetective pipeline (Requirements: nextflow and Docker)
