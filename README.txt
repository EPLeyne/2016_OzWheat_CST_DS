Analysis conducted by Gordon McLachlan and Emmett Leyne for the CSIRO Agriculture and Food Data School in April 2019.
Project Leader: Shannon Dillon.

OzWheat diversity panel is a collection of 286 Australian wheat cultivars that broadly reperesents lines that are commonly used in Australia as well as some experimental lines.
In 2016 the panel was grown in temperature controlled cabinets in Black Mountain in two batches, Long Day (L, 16 hours light) and Short Day (S, 8 hours light). Temperatures were maintained at 6C at 'night' and 10C at 'day'.
At the 2-leaf stage the apex of the plants were collected in a set 2-hour period and RNA was extracted. The RNA was sent for sequencing.
Sequencing conducted by Garvan Institute.



Data supplied in fastq.gz format in the Casava 1.8 format:

Example filename: CA73YANXX_8_161220_BPO--000_Other_TAAGGCGA-CTCTCTAT_R_161128_SHADIL_LIB2500_M002_R1.fastq.gz

Each read result is presented as a 4 line result.
Example first line: @EAS139:136:FC706VJ:2:2104:15343:197393 1:Y:18:ATCACG

EAS139 	- 	the unique instrument name
136 	-	the run id
FC706VJ -	the flowcell id
2 		- 	flowcell lane
2104 	-	tile number within the flowcell lane
15343 	-	'x'-coordinate of the cluster within the tile
197393 	-	'y'-coordinate of the cluster within the tile
1 		- 	the member of a pair, 1 or 2 (paired-end or mate-pair reads only)
Y 		- 	Y if the read is filtered, N otherwise
18 		-	0 when none of the control bits are on, otherwise it is an even number
ATCACG 	-	index sequence 

Source: https://en.wikipedia.org/wiki/FASTQ_format

Second line is the result of base pairs of the RNA read in ACGT format of approximately 100 bases.
Third line is a '+'.
Fourth line is a quality analysis of the result matching to each base in the second line.

