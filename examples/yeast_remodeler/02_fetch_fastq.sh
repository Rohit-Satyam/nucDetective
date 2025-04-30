#!/usr/bin/env bash

MY_PWD=$1
cd $MY_PWD"/data"

mkdir raw_data
cd raw_data

# Download the FASTQ files from the provided URLs
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/002/SRR2045632/SRR2045632_1.fastq.gz -o SRR2045632_GSM1700691_isw1_isw2_chd1_A_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/002/SRR2045632/SRR2045632_2.fastq.gz -o SRR2045632_GSM1700691_isw1_isw2_chd1_A_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/003/SRR2045633/SRR2045633_1.fastq.gz -o SRR2045633_GSM1700692_isw1_isw2_chd1_B_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/003/SRR2045633/SRR2045633_2.fastq.gz -o SRR2045633_GSM1700692_isw1_isw2_chd1_B_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/001/SRR2045611/SRR2045611_1.fastq.gz -o SRR2045611_GSM1700670_WT_B_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/001/SRR2045611/SRR2045611_2.fastq.gz -o SRR2045611_GSM1700670_WT_B_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/006/SRR2045626/SRR2045626_1.fastq.gz -o SRR2045626_GSM1700685_chd1_A_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/006/SRR2045626/SRR2045626_2.fastq.gz -o SRR2045626_GSM1700685_chd1_A_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/004/SRR2045624/SRR2045624_1.fastq.gz -o SRR2045624_GSM1700683_isw1_A_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/004/SRR2045624/SRR2045624_2.fastq.gz -o SRR2045624_GSM1700683_isw1_A_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/005/SRR2045625/SRR2045625_1.fastq.gz -o SRR2045625_GSM1700684_isw1_B_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/005/SRR2045625/SRR2045625_2.fastq.gz -o SRR2045625_GSM1700684_isw1_B_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR251/003/SRR2518213/SRR2518213_1.fastq.gz -o SRR2518213_GSM1700682_isw2_B_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR251/003/SRR2518213/SRR2518213_2.fastq.gz -o SRR2518213_GSM1700682_isw2_B_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/007/SRR2045627/SRR2045627_1.fastq.gz -o SRR2045627_GSM1700686_chd1_B_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/007/SRR2045627/SRR2045627_2.fastq.gz -o SRR2045627_GSM1700686_chd1_B_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/002/SRR2045622/SRR2045622_1.fastq.gz -o SRR2045622_GSM1700681_isw2_A_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/002/SRR2045622/SRR2045622_2.fastq.gz -o SRR2045622_GSM1700681_isw2_A_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/000/SRR2045610/SRR2045610_1.fastq.gz -o SRR2045610_GSM1700669_WT_A_Saccharomyces_cerevisiae_MNase-Seq_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR204/000/SRR2045610/SRR2045610_2.fastq.gz -o SRR2045610_GSM1700669_WT_A_Saccharomyces_cerevisiae_MNase-Seq_2.fastq.gz



