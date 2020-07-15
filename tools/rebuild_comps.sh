#!/bin/bash
COMP_DEFS=composites.txt
SOURCE_UFO=Lateef-Regular.ufo
TARGET_UFO=Lateef-Regular-composites.ufo
MASTER_DIR=source/masters

echo
echo "Rebuilding composites..."

# Check we're in the same directory as the source UFO
if [ ! -d "$SOURCE_UFO" ]
then
	echo "Error: Please run this script from the source directory containg '$SOURCE_UFO'"
	exit
fi

psfbuildcomp \
	-p scrlevel=w \
	--noflatten \
	--color \
	--remove '_?(above|aboveLeft|below|center|ring|through)$' \
	--preserve 'dia[AB]|alef$' \
	-i "$COMP_DEFS" "$SOURCE_UFO" "$TARGET_UFO"

echo "Composite rebuild done."
