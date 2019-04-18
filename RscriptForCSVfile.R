#Big Data Metadata
#pull variables out of .csv file & headers from .gz

#Read.csv file and remove first 14 rows.

#install.packages('tidyverse')
library(tidyverse)

SAMPLES <- read.csv("R_161128_SHADIL_LIB2500_M002.csv", skip=14)
NEWSAMPLES1<- SAMPLES[ -c (1,2,4,7,8)]
NEWSAMPLES2 <- separate(NEWSAMPLES1, "Index", c("Index1", "Index2", "Index_Sequence"), sep=" ")

#Need to remove () around sequence in Index_Sequence

NEWSAMPLES2$Index_Sequence = as.character(gsub("[\\()]", "", NEWSAMPLES2$Index_Sequence))
NEWSAMPLES3 <- NEWSAMPLES2 [ -c (1,2,5)]

#Need to split Extenal.ID into 2 coulmns Treatment & Sample_ID

NEWSAMPLES4 <- separate(NEWSAMPLES3, External.ID, c("Treatment","Sample_ID"), sep = 1 )

#Need to redorder columns

NEWSAMPLES5 <- NEWSAMPLES4[c("Treatment", "Sample_ID", "Index_Sequence")]

#or could use NEWSAMPLES5 <- NEWSAMPLES4[c(2,3,1)]

#sort Treatment & Sample ID

NEWSAMPLES6 <- NEWSAMPLES5[order(NEWSAMPLES5$Sample_ID),]
NEWSAMPLES7 <- NEWSAMPLES6[order(NEWSAMPLES6$Treatment),]


#NEWSAMPLES7$col2 <- gsub("(\\d)+", "0\\1", NEWSAMPLES7$col2)




