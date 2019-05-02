# Script to iterate through the .fastq files in the directory and write the first 4 items of metadata from the first line to a file. 
import glob
import gzip

globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq.gz')   #glob.glob to make a list of all the files in 
#the directory (need to change path as needed)

for filenames in globfiles:
    with gzip.open (filenames, 'r') as f:      # open that file name as 'r' (read) as in_file
        in_file = f.read()                  
        with open ('/OSM/CBR/AF_DATASCHOOL/output/epl/first_lines2.csv', 'a') as out_file:    # create the .csv file as 'a' (append) as out_file
            num = 0                             # create a variable 'num' with the value 0
            if num < 1:                         # if num is less than 1
                    out_file.write(filenames + ',' + str(in_file[0:27]) + '\n')               # write the file name to the file
                    num =+ 1                    # add 1 to the num variable (to end the loop)
