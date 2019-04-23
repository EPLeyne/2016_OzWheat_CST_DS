# Import the names of the files in a directory

files = glob.glob('data/fastq/*.fastq')

for file in files:   
    with open (file, 'r') as in_file:
        with open ('first_lines2.csv', 'a') as out_file:
            num = 0
            for x in in_file:
                if num<1 and x[0] == '@':
                    out_file.write(file)
                    out_file.write('\t')
                    out_file.write(x[0:27])
                    out_file.write('\n')
                    num =+ 1


# Need to add script down here to delimit and delete unwanted data, might be better in R but will look it up.