#!/bin/bash

# If the user provides less than one argument to the script, 
# then print the help message
if [ $# -lt 1 ]
 then
	echo ""
	echo "The script reports missing fmap files."
  echo "Run it from the bids data directory"
	echo "It takes one argument, the name of the fmap file type:"
	echo "e.g., phasediff, magnitude1, magnitude2"
	echo "example: ${0} phasediff"
	echo ""
	exit 1
fi

# Enter the part of the image name between the subject number and the extension.
# magnitude2, magnitude1, phasediff
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