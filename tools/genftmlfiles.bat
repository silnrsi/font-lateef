@echo off

rem This script rebuilds the algorithmically-generated ftml files. See README.md

rem Copyright (c) 2020 SIL International  (http://www.sil.org)
rem Released under the MIT License (http://opensource.org/licenses/

rem Assumes we're in the root folder, i.e., font-Lateef

if not exist OFL.txt ( 
	echo "Please cd to root of font project to use this script"
	exit 2
)

echo Rebuilding ftml files...
rem py -3 /src/github/font-arab-tools/bin/absgenftml.py -p scrlevel=I -t "AllChars (auto)"         source/masters/Lateef-Regular.ufo  tests/AllChars.ftml        -l logs/AllChars.log         -s "url(../references/LateefGR-1.200.ttf)=LateefGR" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" & rem -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" &
py -3 tools/absgenftml.py -q -t "AllChars (auto)"         source/masters/Lateef-Regular.ufo  tests/AllChars.ftml        -l logs/AllChars.log         -s "url(../references/LateefGR-1.200.ttf)=LateefGR" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" &
py -3 tools/absgenftml.py -q -t "AL Sorted (auto)"        source/masters/Lateef-Regular.ufo  tests/ALsorted.ftml        -l logs/ALsorted.log         -s "url(../references/LateefGR-1.200.ttf)=LateefGR" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" 
py -3 tools/absgenftml.py -q -t "DiacTest1 (auto)"        source/masters/Lateef-Regular.ufo  tests/DiacTest1.ftml       -l logs/DiacTest1.log        -s "local(Harmattan)=Har (inst)"                    --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr"  
py -3 tools/absgenftml.py -q -t "DiacTest1 Short (auto)"  source/masters/Lateef-Regular.ufo  tests/DiacTest1-short.ftml -l logs/DiacTest1-short.log  -s "url(../references/LateefGR-1.200.ttf)=LateefGR" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" 
py -3 tools/absgenftml.py -q -t "Subtending Marks (auto)" source/masters/Lateef-Regular.ufo  tests/SubtendingMarks.ftml -l logs/Subtending.log       -s "local(Harmattan)=Har (inst)"                    --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" 
py -3 tools/absgenftml.py -q -t "DaggerAlef (auto)"       source/masters/Lateef-Regular.ufo  tests/DaggerAlef.ftml      -l logs/DaggerAlef.log       -s "url(../references/LateefGR-1.200.ttf)=LateefGR" --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" 
py -3 tools/absgenftml.py -q -t "Kerning (auto)"          source/masters/Lateef-Regular.ufo  tests/Kern.ftml            -l logs/Kerning.log                                                              --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" 
py -3 tools/absgenftml.py -q -t "Yehbarree (auto)"        source/masters/Lateef-Regular.ufo  tests/Yehbarree.ftml       -l logs/Yehbarree.log                                                            --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s "url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT" & rem -s "url(../results/Lateef-Bold.ttf)=Bold-Gr" 
py -3 tools/absgenftml.py -q -t "Feature-Language Interactions (auto)" ^
                                                          source/masters/Lateef-Regular.ufo  tests/FeatLang.ftml        -l tests/logs/FeatLang.log                                                       --ap "_?dia[AB]$" --xsl ../tools/ftml.xsl --scale 250 -i source/glyph_data.csv --langs "sd,ur,ku,rhg,wo" -w "75%%" -s "url(../results/Lateef-Regular.ttf)=Reg-Gr" -s 'url(../results/tests/ftml/fonts/Lateef-Regular_ot_arab.ttf)=Reg-OT' 

echo done.
