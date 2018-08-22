#!~/bin python
"""
This script checks to see how many IDs in a given list are found within the sra folder
It prints those that are not present
"""
import sys
import glob

sra_list = sys.argv[1]
fastq_path = sys.argv[2]

# List of IDs
sra_IDs = []
with open(sra_list) as F:
	for line in F:
		sra_IDs.append(line.strip())

fastqs_found = []
for f in glob.glob(fastq_path + "/*"):
	split_line = f.split("/")
	fastqs_found.append(split_line[-1])

count_missing = 0
for i in sra_IDs:
	fq1 = i + "_1.fastq.gz"
	fq2 = i + "_2.fastq.gz"
	if fq1 not in fastqs_found:
		print(fq1)
		count_missing += 1
	else:
		# Remove it from the list, so if any IDs are left in the end, those IDs should not be in this directory
		fastqs_found.remove(fq1)
	if fq2 not in fastqs_found:
		print(fq2)
		count_missing += 1
	else:
		fastqs_found.remove(fq2)

print("\nFastq files that are missing")
print(count_missing)

print("\nThese IDs were found but shouldn't be here")
print(fastqs_found)