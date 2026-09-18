#!/bin/bash

img_base=$1

for s in sub-*; do
echo "================="
# print the subject dir name
echo ${s}
  if [ ! -e "${s}/fmap/${s}_${img_base}.nii.gz" ]; then
	echo "ALERT: ${s} is missing ${img_base} data!"
	else 
	echo "${s} is fine"
  fi
done
