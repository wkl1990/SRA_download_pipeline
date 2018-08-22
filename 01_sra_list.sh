#!/bin/bash
#input and output
echo path=\"${1}\"
echo input=\"${2}\"
echo output\"${3}\"
cd $1
prefetch.2.8.2 -l $2 | grep -oh SRR[0-9]* > $3
