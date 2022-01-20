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

echo "Rebuilding ftml files..."
tools/absgenftml.py -q -t 'AllChars (auto)'         source/masters/Lateef-Regular.ufo  tests/AllChars.ftml        -l logs/AllChars.log         -s 'url(../references/LateefGR-1.200.ttf)=LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'AL Sorted (auto)'        source/masters/Lateef-Regular.ufo  tests/ALsorted.ftml        -l logs/ALsorted.log         -s 'url(../references/LateefGR-1.200.ttf)=LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'DiacTest1 (auto)'        source/masters/Lateef-Regular.ufo  tests/DiacTest1.ftml       -l logs/DiacTest1.log        -s 'local(Harmattan)=Har (inst)'                    --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' & 
tools/absgenftml.py -q -t 'DiacTest1 Short (auto)'  source/masters/Lateef-Regular.ufo  tests/DiacTest1-short.ftml -l logs/DiacTest1-short.log  -s 'url(../references/LateefGR-1.200.ttf)=LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'Subtending Marks (auto)' source/masters/Lateef-Regular.ufo  tests/SubtendingMarks.ftml -l logs/Subtending.log       -s 'local(Scheherazade)=Sch (inst)'                 --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'DaggerAlef (auto)'       source/masters/Lateef-Regular.ufo  tests/DaggerAlef.ftml      -l logs/DaggerAlef.log       -s 'url(../references/LateefGR-1.200.ttf)=LateefGR' --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'Yehbarree (auto)'        source/masters/Lateef-Regular.ufo  tests/Yehbarree.ftml       -l logs/Yehbarree.log                                                            --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'Kerning (auto)'          source/masters/Lateef-Regular.ufo  tests/Kern.ftml            -l logs/Kerning.log                                                              --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75% -s 'url(../results/LateefLight-Regular.ttf)=Lt' -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' &
tools/absgenftml.py -q -t 'Kerning digits (auto)'   source/masters/Lateef-Regular.ufo  tests/KernDigits.ftml      -l logs/KerningDigits.log                                                        --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg"    -w 75%                                                 -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/LateefBook-Bold.ttf)=BkBld' ; \
												sed -i -e "s/&lt;/</g" -e "s/&gt;/>/g" tests/KernDigits.ftml &
tools/absgenftml.py -q -t 'Feature-Language Interactions (auto)' \
                                                    source/masters/Lateef-Regular.ufo  tests/FeatLang.ftml        -l tests/logs/FeatLang.log                                                       --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,ky" -w 75%                                                 -s 'url(../results/Lateef-Regular.ttf)=Reg' -s 'url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT' &
wait
echo done.
