library(tidyverse)

# Import the names of the .fastq files in the raw data directiory
avail_files <- (list.files('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome', pattern = "/*.fastq.gz"))

# Copy 'avail_files' column into a new 'filenames' column
avail_files$filenames <- avail_files$avail_files
#Coerce the file names into a data frame
avail_files <- as.data.frame(avail_files) 

#Separate the file names in to columns by the '_' delimiter, creating a new _split dataframe as full name may be useful
avail_files_split <- separate(avail_files, "avail_files", c("c1","c2","c3","c4", "c5","indexTag", 'c6','c7', 'researcher', 'c8','c9', 'rep'), sep = "_")

#Separate the last column (rep number) from the file names
avail_files_split <- separate(avail_files_split, 12, c("rep","c10"), sep = 2)

#Drop the columns a that are unneeded from the _split dataframe
col_drop <- c('c1','c2','c3','c4','c5','c6','c7','c8','c9','c10','researcher')
avail_files_split <- select(avail_files_split, (-(col_drop)))

#Write dataframes to csv files
write_csv(avail_files, file.path('/OSM/CBR/AF_DATASCHOOL/output/epl/fastqfiles.csv'))
write_csv(avail_files_split, file.path('/OSM/CBR/AF_DATASCHOOL/output/epl/fastqfiles_split.csv'))
          