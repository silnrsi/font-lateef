#!/bin/bash

# This script rebuilds the kerning files for OpenType. See README.md

# Copyright (c) 2020 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Assumes we're in the root folder, i.e., font-lateef

# $R is the clustering radius for computing the OpenType kerning. Default is 20 but can be overridden, e.g.:
#      export R=50 updateKerning

# --nooctalap causes script to assume optimized octaboxes needn't be recomputed

set -e	# Stop on error
# set -x	# echo before execution

if [ ! -e OFL.txt ] 
then
	echo "Please cd to root of font project to use this script"
	exit 2
fi

REGONLY=""
FACES=("" Light Book)
WEIGHTS=(Regular Bold)
NOOCTALAP=0

# Look for options:
while [[ $# -gt 0 ]]
do
  case $1 in
    --regOnly)
    REGONLY="--regOnly"
    FACES=("")
    WEIGHTS=(Regular)
    ;;
  
    --nooctalap)
    NOOCTALAP=1
    ;;

    *)
    echo "unrecognized parameter $1"
    exit 
  esac
  shift
done

echo "Updating kerning\nrebuilding fonts without glyph kerning or renaming...\n"

smith distclean
smith configure
smith build --norename --noOTkern $REGONLY

if [ ${NOOCTALAP} == 0 ]
then

  echo "\nrebuilding optimized octaboxes...\n"

  for f in "${FACES[@]}"
  do
    for w in "${WEIGHTS[@]}"
    do
      tools/octalap -q -j 0 -o source/Lateef$f-$w-octabox.json results/Lateef$f-$w.ttf &
    done
  done

  echo waiting for octalap...
  wait

  echo "\nrebuilding fonts (with new octaboxes)...\n" 

  smith clean
  smith build --norename --noOTkern $REGONLY

fi

echo "\nrebuilding collision-avoidance-based kerning fea files...\n"

# Use a temp directory
outdir=results/grkern2fea_r${R:=20}
mkdir -p $outdir

for f in "${FACES[@]}"
do
  for w in "${WEIGHTS[@]}"
  do
    ( \
      grkern2fea -e graphite -i source/kerndata.ftml -F ut53=0        -f results/Lateef$f-$w.ttf                 $outdir/rawPairData-$f-$w.txt        ; \
      tools/renumberKernData.py $outdir/rawPairData-$f-$w.txt                                                    $outdir/rawPairData-$f-$w-nozwj.txt  ; \
      grkern2fea -s strings  -i $outdir/rawPairData-$f-$w-nozwj.txt -f results/Lateef$f-$w.ttf  -r ${R:=20} -R   $outdir/Lateef$f-$w-caKern.fea       ; \
      sed -e s/kasratan-ar/@_diaB/g -e s/fathatan-ar/@_diaA/g $outdir/Lateef$f-$w-caKern.fea  > source/opentype/Lateef$f-$w-caKern.fea \
    ) &
  done
done

# old: ( \
# old:   grkern2fea -e graphite -i source/kerndata.ftml -F ut53=0        -f results/Lateef-Bold.ttf                    $outdir/rawPairData-Bold.txt           ; \
# old:   tools/renumberKernData.py $outdir/rawPairData-Bold.txt                                                           $outdir/rawPairData-Bold-nozwj.txt     ; \
# old:   grkern2fea -s strings  -i $outdir/rawPairData-Bold-nozwj.txt    -f results/Lateef-Bold.ttf     -r ${R:=20} -R $outdir/caKern-Bold.fea                ; \
# old:   sed -e s/kasratan-ar/@_diaB/g -e s/fathatan-ar/@_diaA/g $outdir/caKern-Bold.fea  > source/opentype/caKern-Bold.fea \
# old: ) &

wait

echo "finished successfully, and the following files were regenerated:"
if [ ${NOOCTALAP} == 0 ] 
then
  for f in "${FACES[@]}" ; do
    for w in "${WEIGHTS[@]}" ; do
      echo " - source/Lateef$f-$w-octabox.json"
    done
  done
fi

for f in "${FACES[@]}"
do
  for w in "${WEIGHTS[@]}"
  do
    echo " - source/opentype/Lateef$f-$w-caKern.fea"
  done
done

echo "
Notes:
  - Intermediate files are in $outdir
  - The fonts have not been rebuilt with these modified files. To complete the build, use:

	smith clean
	smith build test $REGONLY

Please verify changes and commit results."
