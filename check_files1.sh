#!/bin/bash

for s in sub-*; do
echo "================="
# print the subject dir name
echo ${s}
  if [ ! -e "${s}/fmap/${s}_magnitude2.nii.gz" ]; then
	echo "ALERT: ${s} is missing magnitude2 data!"
	else 
	echo "${s} is fine"
  fi
done