pathSTD<-getwd()
library(stringr)



files.wig<-list.files("PROFILER_out/RUN/01_NUCLEOSOME_PROFILE/wig/")


##sample name
Sample_Name<-files.wig %>%
    str_split_i("_profile",1)

condition<-Sample_Name %>%
    str_sub(1,-3)


normalize<-rep("Norm", length(Sample_Name))
normalize[Sample_Name=="WT_A"]<-"Reference"

df<-data.frame(Sample_Name=Sample_Name,
               path_wig=paste0(pathSTD,"/PROFILER_out/RUN/01_NUCLEOSOME_PROFILE/wig/",files.wig),
               normalize,
               condition)

write.csv(df, row.names = F,
          file="data/samples_inspector.csv", quote = F)
