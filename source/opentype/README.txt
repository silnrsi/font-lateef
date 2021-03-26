sources/opentype/README.txt
==================

This file describes the fea source files included with the Lateef
font family. This information should be distributed along with the Lateef
fonts and any derivative works.

These files are part of the Lateef font family 
(http://software.sil.org/lateef/) and are 
Copyright (c) 1994-2020 SIL International (http://www.sil.org/),
with Reserved Font Names "Lateef" and "SIL".

This Font Software is licensed under the SIL Open Font License,
Version 1.1.

gsub.feax     source file for OpenType substitution logic.
gpos.feax     source file for OpenType positioning logic
Lateef*.feax  Master source for each family member. This simply includes
              other needed files.
*-cakern.fea  generated font-specific collision-avoidance-based kerning.

Note that .feax files use, or include files that use, FEA extensions 
provided by pysilfont.