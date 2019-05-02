#Big Data Metadata
#pull variables out of .csv file & headers from .gz

#Read.csv file and remove first 14 rows.

#install.packages('tidyverse')
library(tidyverse)

#Need to show which directory .csv file is in, currently in same directory.

SAMPLES <- read.csv("/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/R_161128_SHADIL_LIB2500_M002.csv", skip=14)
NEWSAMPLES1<- SAMPLES[ -c (2,4,7,8)]
NEWSAMPLES2 <- separate(NEWSAMPLES1, "Index", c("Index1", "Index2", "Index_Sequence"), sep=" ")

#Need to remove () around sequence in Index_Sequence

NEWSAMPLES2$Index_Sequence = as.character(gsub("[()]", "", NEWSAMPLES2$Index_Sequence))
NEWSAMPLES3 <- NEWSAMPLES2 [ -c (2,3,6)]

#Need to split Extenal.ID into 2 columns Treatment & Sample_ID

NEWSAMPLES4 <- separate(NEWSAMPLES3, External.ID, c("Treatment","Sample_ID"), sep = 1 )

#Need to redorder columns

NEWSAMPLES5 <- NEWSAMPLES4[c("Treatment", "Sample_ID", "Index_Sequence", "Sample.Name")]

#or could use, NEWSAMPLES5 <- NEWSAMPLES4[c(3,4,2,1)]

#Need to insert 0 infront of 1-9, to make 01-09, for Sample_ID

NEWSAMPLES5$Sample_ID <- sprintf("%02d", as.numeric(NEWSAMPLES5$Sample_ID))

#This will work, NEWSAMPLES5$Sample_ID <- sprintf("%02d", as.numeric(as.character(NEWSAMPLES5$Sample_ID)))


#sort Treatment & Sample ID

NEWSAMPLES6 <- NEWSAMPLES5[order(NEWSAMPLES5$Sample_ID),]
NEWSAMPLES7 <- NEWSAMPLES6[order(NEWSAMPLES6$Treatment),]

#need to create output file tab delimited for NEWSAMPLES7
#need to specify which directory to send it to, currently in same directory.

write.table(NEWSAMPLES7, "/OSM/CBR/AF_DATASCHOOL/output/gmcl/metadataCSV.txt", sep="\t")

#Ready to join with metadata from .gz files