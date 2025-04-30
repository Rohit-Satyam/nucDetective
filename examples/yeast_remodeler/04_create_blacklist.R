#!/usr/bin/env Rscript 

# Get working directory
pathSTD<-getwd()

# create blacklist
#genomic elements to remove

#mitochondrial chromosome
mito<-data.frame(chr="Mito",start=0,end=85779)

#rDNA
rDNA<-data.frame(chr="XII",start=451000,end=469500)

#chd1
chd1<-data.frame(chr="V",start=505300,end=509798)

#isw1
isw1<-data.frame(chr="II",start=708150,end=711539)

#isw2
isw2<-data.frame(chr="XV",start=884200,end=887876)

#irregular elements
irregular<-data.frame(chr="X",start=472500,end=484000)
irregular2<-data.frame(chr="VIII",start=85200,end=95160)
irregular3<-data.frame(chr="VIII",start=212300,end=216200)
irregular4<-data.frame(chr="VII",start=0,end=8900)
irregular5<-data.frame(chr="VIII",start=531400,end=553500)
irregular6<-data.frame(chr="II",start=29700,end=36200)

#merge
blacklist<-rbind(mito,rDNA, isw1, isw2, chd1, irregular, 
    irregular2, irregular3, irregular4, irregular5, irregular6)

# Write a .bed file 
write.table(blacklist, row.names = F,col.names = F,
          file="data/blacklist.bed", quote = F, sep="\t")
