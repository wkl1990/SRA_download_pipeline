#!/bin/bash
echo path=\"${1}\"
echo max-size=\"${2}\"
echo input_krt=\"${3}\"
# If downloading dbGaP data, prefetch must be called from within the project space folder
cd $1
# Download the SRA file
prefetch.2.8.2 --max-size=$2 $3
# delete temporary files 
rm *.tmp.aspera-ckpt
rm *.tmp.partial
rm *.lock
rm *.tmp
rm *.vdbcache.cache
rm *.vdbcache