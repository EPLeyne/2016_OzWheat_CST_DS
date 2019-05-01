#install.packages('tidyverse')
library(tidyverse)

#read files to be merged
met#we need to join files to form metadata file

adataCSV <- read(/OSM/CBR/AF_DATASCHOOL/output/gmcl/metadatCSV.csv)
fastqfiles_split <- read(/OSM/CBR/AF_DATASCHOOL/output/gmcl/fastqfiles_split.csv)


# merge two data frames by "Index_Sequence"
MetadataMerged <- merge(data metadataCSV, data fastqfiles_split, by="Index_Sequence")

