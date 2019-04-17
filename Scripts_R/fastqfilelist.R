library(tidyverse)


avail_files <- (list.files('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome', pattern = "/*.fastq.gz"))

avail_files <- as.data.frame(avail_files) 

avail_files <- separate(avail_files, "avail_files", c("c1","c2","c3","c4", "indexTag", 'c5', 'c6','c7', 'researcher', 'c8','c9', 'rep'), sep = "_")
# Not workingavail_files <- separate(avail_files, 12, c("rep","1","2"), sep = ".")

write_csv(avail_files, file.path('/OSM/CBR/AF_DATASCHOOL/output/epl/fastqfiles.csv'))

          