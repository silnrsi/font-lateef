perl makeTTFB.pl ../absGlyphList/absGlyphList.txt  > absGlyphList.ttfb

perl makeEncFile.pl -f s ../absGlyphList/absGlyphList.txt > Sch.enc
perl makeEncFile.pl -f h ../absGlyphList/absGlyphList.txt > Har.enc
perl makeEncFile.pl -f l ../absGlyphList/absGlyphList.txt > Lat.enc
perl makeEncFile.pl      ../absGlyphList/absGlyphList.txt > All.enc

perl makeEncFile.pl -f s -s ../absGlyphList/absGlyphList.txt > Sch-shapes.enc
perl makeEncFile.pl -f h -s ../absGlyphList/absGlyphList.txt > Har-shapes.enc
perl makeEncFile.pl -f l -s ../absGlyphList/absGlyphList.txt > Lat-shapes.enc
perl makeEncFile.pl      -s ../absGlyphList/absGlyphList.txt > All-shapes.enc

