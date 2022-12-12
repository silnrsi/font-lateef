#!/bin/bash
# Copyright (c) 2020-2022 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Run from source/masters directory containing UFOs.


COMP_DEFS=composites.txt

echo
echo "Rebuilding composites..."


build_one() {
	
	SOURCE_UFO=$1
	if [ "$2" = "" ]
	then
		TARGET_UFO=$1
		echo "Building composites in $SOURCE_UFO..."
	else
		echo "Building composites from $SOURCE_UFO to $TARGET_UFO..."
		TARGET_UFO=$2
	fi

	# Check we're in the same directory as the source UFO
	if [ ! -d "$SOURCE_UFO" ]
	then
		echo "Error: Please run this script from the source directory containing '$SOURCE_UFO'"
		exit
	fi

	# docs: https://github.com/silnrsi/pysilfont/blob/master/docs/scripts.md#psfbuildcomp
	# colors: unchanged, changed, new glyphs
		# --colors="none" \
	psfbuildcomp \
		-p scrlevel=w \
		--noflatten \
		--colors="leave,g_cyan,g_pink" \
		--remove '_?(above|aboveLeft|below|center|ring|through)$' \
		--preserve 'dia[AB]|alef$' \
		-i "$COMP_DEFS" "$SOURCE_UFO" "$TARGET_UFO"
	echo

}

# Build each master
build_one "Lateef-ExtraLight.ufo"
build_one "Lateef-Regular.ufo"
build_one "Lateef-ExtraBold.ufo"
# build_one "Lateef-ExtraLight.ufo"   "Lateef-ExtraLight-composites.ufo"
# build_one "Lateef-Regular.ufo" "Lateef-Regular-composites.ufo"
# build_one "Lateef-ExtraBold.ufo"   "Lateef-ExtraBold-composites.ufo"

echo "Composite rebuild done."
