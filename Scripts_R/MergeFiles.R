#install.packages('tidyverse')
library(tidyverse)

#read files to be merged
#we need to join files to form metadata file

metadataCSV <- read.table( '/OSM/CBR/AF_DATASCHOOL/output/gmcl/metadataCSV.csv')
fastqfiles_split <- read.csv( '/OSM/CBR/AF_DATASCHOOL/output/gmcl/fastqfiles_split.csv', sep=',')


# merge two data frames by "Index_Sequence"
MetadataMerged <- merge(metadataCSV, fastqfiles_split, by="Index_Sequence")

#need to create output file tab delimited for MetadataMerged
#need to specify which directory to send it to, currently in same directory.
#write.table(MetadataMerged, "/OSM/CBR/AF_DATASCHOOL/output/gmcl/MetadataMerged.txt", sep="\t")
#However rowline number keeps apperaing in output file.

#so creat output file as .CSV
write.csv(MetadataMerged, "/OSM/CBR/AF_DATASCHOOL/output/gmcl/MetadataMerged.csv")

#pull in file with first line from every file, need to refine file before merging
first_lines <- read.table( '/OSM/CBR/AF_DATASCHOOL/output/epl/first_lines.csv', sep = ("_"))
first_lines2 <- first_lines[ -c (1,2,3,4,5,6,7,9,10,11,12,13)]
first_lines3 <- separate(first_lines2, V14, c("rep_instrumentNAME", "run_ID", "flowcel_ID", "flowcell_Lane"), ":")
first_lines4 <- separate(first_lines3, rep_instrumentNAME, c("rep", "instrument_Name"), "@")
first_lines5 <- separate(first_lines4, rep, c("rep", "b"), ".fastq.gz")
first_lines6 <- first_lines5[ -c (3)]
# Rename a column 1 to Index_Sequence
names(first_lines6)[1]<-"Index_Sequence"
#so creat output file as .CSV
write.csv(first_lines6, "/OSM/CBR/AF_DATASCHOOL/output/gmcl/first_lines_refined.csv")

# merge two data frames by "Index_Sequence"
MetadataMergedFinally1 <- merge(MetadataMerged, first_lines6, by=c("Index_Sequence","rep"))

# Rename a column 1 to Index_Sequence
names(MetadataMergedFinally1)[5]<-"Vendor_Sample_Name"
#Need to redorder columns
MetadataMergedFinally2 <- MetadataMergedFinally1[c(4,3,2,1,5,6,7,8,9)]
#Need to insert 0 infront of 1-9, to make 01-09, for Sample_ID
MetadataMergedFinally2$Sample_ID <- sprintf("%02d", as.numeric(MetadataMergedFinally2$Sample_ID))

#sort Treatment & Sample ID
MetadataMergedFinally3 <- MetadataMergedFinally2[order(MetadataMergedFinally2$Sample_ID),]
MetadataMergedFinally4 <- MetadataMergedFinally3[order(MetadataMergedFinally3$Treatment),]

#so creat output file as .CSV
write.csv(MetadataMergedFinally3, "/OSM/CBR/AF_DATASCHOOL/output/gmcl/MetadataMergedFinallyv1.csv", row.names=FALSE)
write.csv(MetadataMergedFinally4, "/OSM/CBR/AF_DATASCHOOL/output/gmcl/MetadataMergedFinallyv2.csv", row.names=FALSE)

