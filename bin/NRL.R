#!/usr/bin/env Rscript

args <- commandArgs(TRUE)
# Header ------------------------------------------------------------------

# Skript to determine mean NRL in Pf MNase-Seq data
# by Simon Holzinger mod. by Leo Schmutterer to fit the pipeline

# Dependencies ------------------------------------------------------------
library(plyranges)
library(tidyverse)
library(ggpubr)
library(swissknife)
library(furrr)


# Main --------------------------------------------------------------------

## Setup Filepaths and -names

#read in bams
inFiles <- grep("\\.bam$", args, value = TRUE)
#read in everything else
fileNames <- args[-grep("\\.bam", args)]
#remove the peak number from the names
fileNames <- fileNames[-length(fileNames)]
#remove brakets from names
fileNames <- gsub("[][, ]", "", fileNames)



# Calculate NRLs ----------------------------------------------------------
# based on https://fmicompbio.github.io/swissknife/reference/index.html

smooth_span <- 0.3
num_peaks_used <- as.integer(tail(args, n = 1))


NRLs_wg <- inFiles %>%
  set_names(fileNames) %>%
  map_df(function(x) {
    sample <- x %>%
      basename() %>%
      tools::file_path_sans_ext() %>%
      tools::file_path_sans_ext()
    
    pg <- calcPhasogram(x)
    eNRL <- estimateNRL(
      pg,
      usePeaks = 1:num_peaks_used,
      span2 = smooth_span
    )[1:2]
    
    # Plot Phasogram
    pdf(paste0("NRL_", sample, ".pdf"), width = 7, height = 5)
    
    # extra top/left space so title and y-axis do not get clipped
    par(
      mar = c(5.1, 5.1, 4.5, 2.1),
      oma = c(0, 0, 2.5, 0)
    )
    
    plotPhasogram(
      pg,
      usePeaks = 1:num_peaks_used,
      xlim = c(0, 3000),
      span2 = smooth_span
    )
    
    # draw title in outer top margin so it never overlaps plot contents
    mtext(sample, side = 3, line = 0.8, outer = TRUE, font = 2)
    
    dev.off()
    
    # Return NRL with CI
    tibble(
      NRL = eNRL$nrl,
      nrl.2.5 = eNRL$nrl.CI95[1],
      nrl.97.5 = eNRL$nrl.CI95[2]
    )
    
  }, .id = "sample")

# Save NRL table
write_csv(NRLs_wg, file = paste0(fileNames, "_NRLs.csv"))
