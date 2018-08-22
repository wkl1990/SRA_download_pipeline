#!/bin/bash
echo proj_path=\"${1}\"
echo sra_path=\"${2}\"
echo fastq_path=\"${3}\"
cd $1
mkdir -p ${3}/validation_failures
ls ${2}/*.sra | while read id
do
file=${id##*/}
sample_id=${file%.*}
echo $file $sample_id
vdb-validate.2.8.2 ${2}/${sample_id}.sra &> \
	${3}/${sample_id}.validation_out
if grep -q 'err' ${3}/${sample_id}.validation_out;
then
	echo 'Verification of ${sample_id}.sra failed'
	cp ${3}/${sample_id}.validation_out \
		${3}/validation_failures
else
	echo 'No errors found in ${sample_id}.sra'
	# Convert the SRA into fastq
	fastq-dump.2.8.2 -v --gzip --split-files \
		-O $3 \
		${2}/${sample_id}.sra
	rm ${2}/${sample_id}.sra ${3}/${sample_id}.validation_out
fi
done