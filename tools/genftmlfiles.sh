#!/bin/sh

# This script rebuilds the algorithmically-generated ftml files. See README.md

# Copyright (c) 2020-2022 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Assumes we're in the root folder, i.e., font-Lateef

set -e

if [ ! -e OFL.txt ] 
then
	echo "Please cd to root of font project to use this script"
	exit 2
fi

if [ ! -e results/flo_cache/Lateef-Regular.woff2 ]
then
	# Cache the Regular font from FLO to use as the "previous font"
	echo "Retrieving FLO woff2 for comparison"
	mkdir -p results/flo_cache/
	wget -nv -P results/flo_cache/ "http://fonts.languagetechnology.org/fonts/sil/lateef/web/Lateef-Regular.woff2"
	echo
fi

echo "Rebuilding ftml files..."
tools/absgenftml.py -q -t 'AllChars (auto)'            source/masters/Lateef-Regular.ufo  tests/AllChars-auto.ftml        -l logs/AllChars.log         --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'url(../results/flo_cache/LateefGR-1.200.ttf)|LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'AL Sorted (auto)'           source/masters/Lateef-Regular.ufo  tests/ALsorted-auto.ftml        -l logs/ALsorted.log         --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'url(../results/flo_cache/LateefGR-1.200.ttf)|LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'DiacTest1 (auto)'           source/masters/Lateef-Regular.ufo  tests/DiacTest1-auto.ftml       -l logs/DiacTest1.log        --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'local(Harmattan)|Har (inst)'                           --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' & 
tools/absgenftml.py -q -t 'DiacTest1 Short (auto)'     source/masters/Lateef-Regular.ufo  tests/DiacTest1-short-auto.ftml -l logs/DiacTest1-short.log  --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'url(../results/flo_cache/LateefGR-1.200.ttf)|LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Subtending Marks (auto)'    source/masters/Lateef-Regular.ufo  tests/SubtendingMarks-auto.ftml -l logs/Subtending.log       --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'local(Scheherazade New)|SchNew (inst)'                 --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'DaggerAlef (auto)'          source/masters/Lateef-Regular.ufo  tests/DaggerAlef-auto.ftml      -l logs/DaggerAlef.log       --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'url(../results/flo_cache/LateefGR-1.200.ttf)|LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Yehbarree (auto)'           source/masters/Lateef-Regular.ufo  tests/Yehbarree-auto.ftml       -l logs/Yehbarree.log        --prevfont results/flo_cache/Lateef-Regular.woff2                                                            --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Kerning (auto)'             source/masters/Lateef-Regular.ufo  tests/Kern-auto.ftml            -l logs/Kerning.log          --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'url(../results/flo_cache/LateefGR-1.200.ttf)|LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Kern Data with Marks(auto)' source/masters/Lateef-Regular.ufo  tests/KernData-auto.ftml        -l logs/KernData.log         --prevfont results/flo_cache/Lateef-Regular.woff2 -s 'url(../results/flo_cache/LateefGR-1.200.ttf)|LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Kerning digits (auto)'      source/masters/Lateef-Regular.ufo  tests/KernDigits-auto.ftml      -l logs/KerningDigits.log    --prevfont results/flo_cache/Lateef-Regular.woff2                                                            --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' ; \
												   sed -i -e "s/&lt;/</g" -e "s/&gt;/>/g" tests/KernDigits-auto.ftml &
tools/absgenftml.py -q -t 'Feature-Language Interactions (auto)' \
                                             		   source/masters/Lateef-Regular.ufo  tests/FeatLang-auto.ftml        -l tests/logs/FeatLang.log   --prevfont results/flo_cache/Lateef-Regular.woff2                                                            --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75%                                                 -s 'url(../results/Lateef-Regular.ttf)|Reg' 												&
wait
echo done.
