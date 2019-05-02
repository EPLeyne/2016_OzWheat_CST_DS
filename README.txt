Analysis conducted by Gordon McLachlan and Emmett Leyne for the CSIRO Agriculture and Food Data School in April 2019.
Project Leader: Shannon Dillon.

For Data School analysis workflow please refer to 'Workflow_OzWheat_CST_DS.txt'.


OzWheat diversity panel is a collection of 286 Australian wheat cultivars that broadly reperesents lines that are commonly used in Australia as well as some experimental lines.
In 2016 the panel was grown in temperature controlled cabinets in Black Mountain in two batches, Long Day (L, 16 hours light) and Short Day (S, 8 hours light). Temperatures were maintained at 6C at 'night' and 10C at 'day'.
At the 2-leaf stage the apex of the plants were collected in a set 2-hour period and RNA was extracted. The RNA was sent for sequencing.
Sequencing conducted by Garvan Institute (vendor).

Two types of data files locataed in //OSM/CBR/AF_DATASCHOOL/input/2019-04-12_Transcritome/
*.fastq.gz
R_161128_SHADIL_LIB2500_M002.csv




Data supplied in fastq.gz format in the Casava 1.8 format:

Example filename: CA73YANXX_8_161220_BPO--000_Other_TAAGGCGA-CTCTCTAT_R_161128_SHADIL_LIB2500_M002_R1.fastq.gz

CA73YANXX 						- the flowcell id
8								- flowcell lane
161220_BPO--000					- sample name (vendor supplied)
Other 							- sample origin
TAAGGCGA-CTCTCTAT 				- index sequence
R_161128_SHADIL_LIB2500_M002 	- Vendor manifest sequence
R1 								- Vendor rep

Each read result is presented as a 4 line result.
Example first line: @HWI-D00119:220:CA73YANXX:8:1101:2471:8190 1:N:0:TAAGGCGACTCTCTAT

@HWI-D00119 		- 	the unique instrument name
220 				-	the run id
CA73YANXX 			-	the flowcell id
8 					- 	flowcell lane
1101		 		-	tile number within the flowcell lane
2471			 	-	'x'-coordinate of the cluster within the tile
8190			 	-	'y'-coordinate of the cluster within the tile
1 					- 	the member of a pair, 1 or 2 (paired-end or mate-pair reads only)
N 		 			- 	Y if the read is filtered, N otherwise
0		 			-	0 when none of the control bits are on, otherwise it is an even number
TAAGGCGACTCTCTAT 	-	index sequence 

Source: https://en.wikipedia.org/wiki/FASTQ_format

Second line is the result of base pairs of the RNA read in ACGT format of approximately 100 bases.
Third line is a '+'.
Fourth line is a quality analysis of the result matching to each base in the second line.





Data supplied in R_161128_SHADIL_LIB2500_M002.csv file:

First 15 lines are metadata concerning the shipment of the samples and the delivery of the results.

Following lines:
Example line:         161220_BPO--000,Other,NXIKV2-D N701-S502 (TAAGGCGA-CTCTCTAT),FD02704185,S1,Egrandis,Submitted Library Standard Depth PE Sequencing (HiSeq 2500) v4.0,Library preparation and QC validation complete

161220_BPO--000 													- Sample/Name (Vendor)
Other 																- Origin 
NXIKV2-D N701-S502 (TAAGGCGA-CTCTCTAT)  							- Index (Vendor)
FD02704185															- Pool ID (Vendor)
S1																	- External ID (CSIRO)
Egrandis															- Reference Genome 
Submitted Library Standard Depth PE Sequencing (HiSeq 2500) v4.0	- Application (Vendor)
Library preparation and QC validation complete						- Progress (Vendor)


