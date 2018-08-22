#!~/bin/python3
import sys
import glob

sra_list = sys.argv[1]
sra_path = sys.argv[2]

# List of IDs
sra_IDs = []

with open(sra_list) as F:
	for line in F:
		sra_IDs.append(line.strip())

IDs_found = []

for f in glob.glob(sra_path+"/*sra"):
	split_string = f.split("/")
	ID = split_string[-1].split('.')[0]
	IDs_found.append(ID)
# Remove redundant
IDs_found = list(set(IDs_found))
count_missing = 0
for i in sra_IDs:
	if i not in IDs_found:
		print(i)
		count_missing += 1

print("\nIDs that are missing")
print(count_missing)