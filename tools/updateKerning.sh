#!/bin/bash

# This script rebuilds the kerning files for OpenType. See README.md

# Copyright (c) 2020-2022 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Assumes we're in the root folder, i.e., font-lateef

# $R is the clustering radius for computing the OpenType kerning. Default is 20 but can be overridden, e.g.:
#      export R=50 updateKerning

# Command line options:
#    --ftml        rebuild ftml
#    --octalap     rebuild optimized octaboxes
#    --regOnly     process only the Lateef Regular font rather than all six

set -e	# Stop on error
set -x	# echo before execution

if [ ! -e OFL.txt ] 
then
	echo "Please cd to root of font project to use this script"
	exit 2
fi

# Default settings:
REGONLY=""
FACES=("" Light Book)
WEIGHTS=(Regular Bold)
OCTALAP=0
FTML=0
FTMLONLY=0

# Look for options:
while [[ $# -gt 0 ]]
do
  case $1 in
    --regOnly)
    REGONLY="--regOnly"
    FACES=("")
    WEIGHTS=(Regular)
    ;;
  
    --octalap)
    OCTALAP=1
    ;;

    --ftml)
    FTML=1
    ;;
    
    --ftmlonly)
    FTML=2
    ;;

    *)
    echo "unrecognized parameter $1"
    echo "Command line options:"
    echo "   --ftml         rebuild ftml"
    echo "   --ftmlonly     rebuild ftml but do nothing else"
    echo "   --octalap      rebuild optimized octaboxes"
    echo "   --regOnly      process only the Lateef Regular font rather than all six"
    exit 
  esac
  shift
done

echo -e "\nUpdating kerning\n"

if [ ${FTML} -gt 0 ]
then
  echo -e "\nrebuilding kerndata.ftml...\n"

  tools/absgenftml.py -p scrlevel=W -t "KernData with Marks" --norendercheck --ap "_?dia[AB]$" \
        --xsl ../tools/ftml.xsl --scale 200 -i source/glyph_data.csv -w "80%" \
        -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" \
        -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" \
        -s "url(../results/Lateef-Bold.ttf)=Bld-Gr" \
        -s "url(../results/tests/ftml/fonts/Lateef-Bold_ot_arab.ttf)=Bld-OT" \
        source/masters/Lateef-Regular.ufo source/kerndata.ftml
fi

if [ ${FTML} -gt 1 ]
then
  exit
fi

echo -e "\nrebuilding fonts with graphite and without glyph kerning or renaming...\n"

smith distclean
smith configure --graphite
smith build --graphite --norename --noOTkern $REGONLY

if [ ${OCTALAP} == 1 ]
then

  echo -e "\nrebuilding optimized octaboxes...\n"

  for f in "${FACES[@]}"
  do
    for w in "${WEIGHTS[@]}"
    do
      octalap -q -j 0 -o source/graphite/Lateef$f-$w-octabox.json results/Lateef$f-$w.ttf &
    done
    # do only 2 at a time to keep from running out of memory
    wait
    echo -e "\noctalap completed for Lateef$f."
  done
  echo -e "\nrebuilding fonts (with new octaboxes) but no glyph kerning or renaming...\n" 

  smith clean
  smith build --graphite --norename --noOTkern $REGONLY

fi



echo -e "\nrebuilding collision-avoidance-based kerning fea files...\n"

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
    ) # &   # If you have enough RAM then run these in parallel
  done
  # do only 2 at a time to keep from running out of memory
  wait
  echo -e "\ngrkern2fea completed for Lateef$f."
done

echo "
finished successfully, and the following files were regenerated:"
if [ ${OCTALAP} == 1 ] 
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