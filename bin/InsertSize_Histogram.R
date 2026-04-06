#!/usr/bin/env Rscript

#### PACKAGE LOADING ####
library(RColorBrewer)

######## DATA LOADING ###########
args <- commandArgs(TRUE)
minSize <- as.numeric(args[1])
maxSize <- as.numeric(args[2])

# defining color palette
dark2 <- c(
  brewer.pal(8, "Dark2"),
  brewer.pal(8, "Set1"),
  brewer.pal(8, "Set2")
)

files <- list.files(
  path = ".",
  pattern = "insert_size_histogram.txt",
  full.names = TRUE,
  recursive = TRUE
)

# sample names
samples <- strsplit(files, split = "/")
names <- sapply(samples, function(x) x[2])

# import data
data <- lapply(files, read.table)

# normalize data
for (i in seq_along(data)) {
  data[[i]]$V3 <- data[[i]]$V2 / sum(data[[i]]$V2)
}

# global x/y limits
x_all <- unlist(lapply(data, function(d) d$V1))
xlim_all <- c(min(x_all) - 50, max(x_all) + 50)

high <- max(sapply(data, function(d) max(d$V2)))
high_fr <- max(sapply(data, function(d) max(d$V3)))

# helper function to draw a plot with legend outside
plot_insert_hist <- function(ycol, ylim, ylab, outfile) {
  pdf(outfile, width = 10, height = 5)
  
  # reserve right margin for legend
  par(mar = c(6.1, 5.1, 4.1, 12.1), xpd = FALSE)
  
  for (i in seq_along(data)) {
    if (i == 1) {
      plot(
        data[[i]]$V1, data[[i]][[ycol]],
        type = "l",
        col = dark2[i],
        lwd = 2,
        xlim = xlim_all,
        ylim = c(0, ylim),
        xlab = "Insert size [bp]",
        ylab = ylab,bty = "l"
      )
    } else {
      lines(
        data[[i]]$V1, data[[i]][[ycol]],
        col = dark2[i],
        lwd = 2
      )
    }
  }
  par(xpd = FALSE)
  abline(v = c(minSize, maxSize), col = "black", lty = 2)
  
  # place legend in the right margin, outside plot area
  legend(
    "topright",
    inset = c(-0.28, 0),
    legend = names,
    col = dark2[seq_along(data)],
    lty = 1,
    lwd = 2,
    bty = "n",
    cex = 0.8,
    y.intersp = 1, xpd = NA
  )
  
  dev.off()
}

plot_insert_hist("V2", high, "Counts",   "InsertSizeHistogram_wide.pdf")
plot_insert_hist("V3", high_fr, "Fraction", "InsertSizeHistogram_Fraction_wide.pdf")
plot_insert_hist("V2", high, "Counts",   "InsertSizeHistogram_narrow.pdf")
plot_insert_hist("V3", high_fr, "Fraction", "InsertSizeHistogram_Fraction_narrow.pdf")
