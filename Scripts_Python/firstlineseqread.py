# Working well with 1 file but is still not looping through more than 1 file


import glob
import csv

files = glob.glob('../*.fastq')
print(files)
num = 0
for file in files:
    with open (file, 'r') as in_file:
        with open ('first_lines.csv', 'w') as out_file:
            for x in in_file:
                if num<1:
                    out_file.write(x[0:27])
                    num += 1