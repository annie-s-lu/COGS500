#!/bin/bash

# If the user provides less than two arguments to the script, 
# then print the help message
if [ $# -lt 2 ]
 then
	echo ""
	echo "The script reports missing image (*.nii.gz) files."
	echo "Run it from the bids data directory containing your subjects."
	echo ""
	echo "It takes two arguments:" 
	echo "1) the name of the file (without the subject or nii.gz extension)"
	echo "e.g., phasediff, magnitude1, magnitude2"
	echo "2) the name of the directory to check"
	echo "e.g., anat, dwi, fmap, func"
	echo "example:  ${0} phasediff fmap"
	echo "example: ${0} acq-AP_dwi dwi"
	echo "example: ${0} task-nad1_run-04_bold func"
	echo ""
	exit 1
fi

# Argument 1 is the part of the image name between the subject number and the extension.
# e.g., magnitude1, magnitude2, phasediff, acq-AP_dwi, task-nad1_run-04_bold
img_base=$1
# Argumant 2 is the directory wheere the image file should be (e.g., anat, dwi, fmap, func) 
modality=$2

# Remind the user of the modality and image file name being checked.
echo "Checking each subject for ${modality}: ${img_base}"

# For each directory starting with sub-, print the requested information
# about any missing files.
for s in sub-*; do
echo "----------------------------"
# print the subject dir name
echo ${s}
  # if not exist the specified file
  if [ ! -e "${s}/${modality}/${s}_${img_base}.nii.gz" ]; then
  # then print an alert with details
	echo "ALERT: ${s} is missing ${modality}: ${img_base} data!"
	else 
  # Otherwise, print that it is fine
	echo "${s} is fine"
  fi
done