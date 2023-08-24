#!/bin/sh

# This script rebuilds the algorithmically-generated ftml files. See README.md

# Copyright (c) 2020-2023 SIL International  (https://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Assumes we're in the root folder, i.e., font-Lateef

set -e

if [ ! -e OFL.txt ] 
then
	echo "Please cd to root of font project to use this script"
	exit 2
fi

prevfont="references/v4.100/Lateef-Regular.ttf"
prevver="4.1"

echo "Rebuilding ftml files..."
tools/absgenftml.py -q -t 'AllChars (auto)'                      source/masters/Lateef-Regular.ufo  tests/AllChars-auto.ftml        -l logs/AllChars.log         --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Light.ttf)|Lt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-Medium.ttf)|Med' -s 'url(../results/Lateef-SemiBold.ttf)|seBld' -s 'url(../results/Lateef-Bold.ttf)|Bld' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'AL Sorted (auto)'                     source/masters/Lateef-Regular.ufo  tests/ALsorted-auto.ftml        -l logs/ALsorted.log         --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'DiacTest1 (auto)'                     source/masters/Lateef-Regular.ufo  tests/DiacTest1-auto.ftml       -l logs/DiacTest1.log        --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' & 
tools/absgenftml.py -q -t 'DiacTest1 Short (auto)'               source/masters/Lateef-Regular.ufo  tests/DiacTest1-short-auto.ftml -l logs/DiacTest1-short.log  --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Subtending Marks (auto)'              source/masters/Lateef-Regular.ufo  tests/SubtendingMarks-auto.ftml -l logs/Subtending.log       --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'DaggerAlef (auto)'                    source/masters/Lateef-Regular.ufo  tests/DaggerAlef-auto.ftml      -l logs/DaggerAlef.log       --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Yehbarree (auto)'                     source/masters/Lateef-Regular.ufo  tests/Yehbarree-auto.ftml       -l logs/Yehbarree.log        --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Kerning (auto)'                       source/masters/Lateef-Regular.ufo  tests/Kern-auto.ftml            -l logs/Kerning.log          --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Kern Data with Marks(auto)'           source/masters/Lateef-Regular.ufo  tests/KernData-auto.ftml        -l logs/KernData.log         --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' &
tools/absgenftml.py -q -t 'Kerning digits (auto)'                source/masters/Lateef-Regular.ufo  tests/KernDigits-auto.ftml      -l logs/KerningDigits.log    --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref' -s 'url(../results/Lateef-ExtraLight.ttf)|ExLt' -s 'url(../results/Lateef-Regular.ttf)|Reg' -s 'url(../results/Lateef-ExtraBold.ttf)|ExBld' ; \
                              sed -i -e "s/&lt;/</g" -e "s/&gt;/>/g"                                tests/KernDigits-auto.ftml &
tools/absgenftml.py -q -t 'Feature-Language Interactions (auto)' source/masters/Lateef-Regular.ufo  tests/FeatLang-auto.ftml        -l tests/logs/FeatLang.log   --prevfont "$prevfont" -s "url(../$prevfont)|$prevver" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky,wo" -w 75% -s 'url(../references/Lateef-Regular.ttf)|ref'                                                 -s 'url(../results/Lateef-Regular.ttf)|Reg' 												&
wait
echo done.
