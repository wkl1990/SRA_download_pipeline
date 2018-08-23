#!/bin/bash
echo path=\"${1}\"
echo max-size=\"${2}\"
echo input_krt=\"${3}\"
echo sra_path=\"${4}\"
# If downloading dbGaP data, prefetch must be called from within the project space folder
cd $1
# Download the SRA file
prefetch.2.8.2 --max-size=$2 $3
# delete temporary files 
rm -f ${4}/*.tmp.aspera-ckpt
rm -f ${4}/*.tmp.partial
rm -f ${4}/*.lock
rm -f ${4}/*.tmp
rm -f ${4}/*.vdbcache.cache
rm -f ${4}/*.vdbcache