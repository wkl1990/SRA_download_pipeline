# Pipeline for dbGap SRA file download
## Info.
* Description: This pipeline is used to download, check, and convert the SRA files.
* Reference: [SRA_Download_BW](https://wiki.ncsa.illinois.edu/download/attachments/44958475/SRA_Download_BW.%20Final.Aug18_2017.pdf?version=1&modificationDate=1505510727000&api=v2)
* Author: WKL
* Date: 2018-08-22
* Environment: Shell and Python3
## Step-by-step
1. Create SRA List
	* Usage: 
		+ sh 01_sra_list.sh path input output
	* OPTIONS:
		+ path: the path which contain the krt file.
		+ input: the input krt file.
		+ output: the output list file.
2. Download SRA files
	* Usage: 
		+ sh 02_download.sh path max_size input_krt
	* OPTIONS:
		+ path: the path which is the project space folder.
		+ max_size: the maximum file size to download. 
		+ input: the input krt file.
3. Determine which SRA IDs did not finish downloading
	* Usage: 
		+ python3 03_checkSRAsDownloaded.py sra_list sra_path
	* OPTIONS:
		+ sra_list: the list file which gets from step 1.
		+ sra_path: the folder which contains the downloaded SRA files.
4. Convert SRA to fastq.gz
	* Usage: 
		+ sh 04_sra2fastq.sh proj_path sra_path fastq_path
	* OPTIONS:
		+ proj_path: the path which is the project space folder.
		+ sra_path: the folder which contains the downloaded SRA files.
		+ fastq_path: the path which to put converted fastq files.
5. Verify that all the fastq files are present
	* Usage: 
		+ python3 05_checkFastqsConverted.py sra_list fastq_path
	* OPTIONS:
		+ sra_list: the list file which gets from step 1.
		+ fastq_path: the fastq files path.
