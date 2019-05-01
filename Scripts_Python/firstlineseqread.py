# Script to iterate through the .fastq files in the directory and write the first 4 items of metadata from the first line to a file. 
import glob
import gzip

<<<<<<< HEAD
globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/CA73YANXX_8_161220_BPO--030_Other_CGAGGCTG-CGTCTAAT_R_161128_SHADIL_LIB2500_M002_R1.fastq.gz')   #glob.glob to make a list of all the files in the directory (need to change path as needed)

for filenames in globfiles:
    with gzip.open (filenames, 'rb') as f:
        in_file = f.read()                  # open that file name as 'r' (read) as in_file
        with open ('/OSM/CBR/AF_DATASCHOOL/output/epl/first_lines.csv', 'a') as out_file:    # create the .csv file as 'a' (append) as out_file
            num = 0                                         # create a variable 'num' with the value 0
            if num < 1:                                 # if num is less than 1
                    out_file.write(filenames)               # write the file name to the file
                    out_file.write('\t')                    # then a tab
                    out_file.write(in_file[0:27])                 # write the first 27 characters from the line to the file
                    out_file.write('\n')                    # then a new line
                    num =+ 1                                # add 1 to the num variable (to end the loop)


# Need to add script down here to delimit and delete unwanted data, might be better in R but will look it up.
=======
globfiles = glob.glob('/OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/*.fastq.gz')   #glob.glob to make a list of all the files in 
#the directory (need to change path as needed)

for filenames in globfiles:
    with gzip.open (filenames, 'rb') as f:      # open that file name as 'r' (read) as in_file
        in_file = f.read()                  
        with open ('/OSM/CBR/AF_DATASCHOOL/output/epl/first_lines.csv', 'a') as out_file:    # create the .csv file as 'a' (append) as out_file
            num = 0                             # create a variable 'num' with the value 0
            if num < 1:                         # if num is less than 1
                    out_file.write(filenames + '\t' + str(in_file[0:27]) + '\n')               # write the file name to the file
                    num =+ 1                    # add 1 to the num variable (to end the loop)
>>>>>>> 6f3fe5190e38fcebbbdae877a48cc72dc0aa7234
