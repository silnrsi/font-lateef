#!/bin/bash
COMP_DEFS=composites.txt
# MASTER_DIR=source/masters

echo
echo "Rebuilding composites..."


build_one() {
	
	SOURCE_UFO=$1
	TARGET_UFO=$1

	# Check we're in the same directory as the source UFO
	if [ ! -d "$SOURCE_UFO" ]
	then
		echo "Error: Please run this script from the source directory containing '$SOURCE_UFO'"
		exit
	fi

	echo "Building composites from $SOURCE_UFO to $TARGET_UFO..."
	psfbuildcomp \
		-p scrlevel=w \
		--noflatten \
		--color \
		--remove '_?(above|aboveLeft|below|center|ring|through)$' \
		--preserve 'dia[AB]|alef$' \
		-i "$COMP_DEFS" "$SOURCE_UFO" "$TARGET_UFO"
	echo

}

# Build each master
build_one "Lateef-Light.ufo"   "Lateef-Light-composites.ufo"
build_one "Lateef-Regular.ufo" "Lateef-Regular-composites.ufo"
build_one "Lateef-Black.ufo"   "Lateef-Black-composites.ufo"

echo "Composite rebuild done."
