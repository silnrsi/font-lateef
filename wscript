#! /usr/bin/python
# this is a smith configuration file

# set the default output folders
out="results"
DOCDIR=["documentation", "web"]
OUTDIR="installers"
ZIPDIR="releases"
TESTDIR='tests'
TESTRESULTSDIR = 'tests'
# STANDARDS = 'standards'

# set the font name, version, licensing and description
APPNAME="LateefGR"
VERSION="1.220"

TTF_VERSION=VERSION
COPYRIGHT="Copyright (c) 2004-2017, SIL International (http://www.sil.org)"
LICENSE='OFL.txt'

DESC_NAME = "LateefGR"
DESC_SHORT = "Unicode Arabic font for southern Asia"
DESC_LONG = """
Lateef is an extended Arabic script font designed by SIL International.

Lateef is named after Shah Abdul Lateef Bhitai, the famous Sindhi mystic and poet. 
It is intended to be an appropriate style for use in Sindhi and other languages of the southern Asia:

Lateef is currently available in Regular weight only.
Font sources are published in the repository and a smith open workflow is
used for building, testing and releasing.
"""
# set up the sile tests (using fontproof)
testCommand('sile', cmd='${SILE} --debug versions -o "${TGT}" "${SRC[0].abspath()}" -f "${SRC[1]}"', extracmds=['sile'], shapers=0, supports=['.sil'], ext='.pdf')

DEBPKG = 'fonts-sil-lateefgr'

ftmlTest('tools/ftml.xsl')

AP = 'source/LateefReg_tmp.xml'

font(target = process('LateefGR-Regular.ttf', cmd('${TYPETUNER} -o ${TGT} add ${SRC} ${DEP}', 'source/typetuner.xml'), cmd('perl ../tools/bin/abs_psfix ${DEP} ${TGT}'), name('LateefGR') ),
	source = 'source/LateefReg.ttf',
	graphite = gdl('Lateef-Regular.gdl',
		params = '-D',
		master = 'source/master.gdl',
		make_params = '--package "../tools/perllib/zork.pm" -o "_above _below _center _ring _through above below center ring through"  --classprops',
		depends = ['source/cp1252.gdl', 'source/features.gdh']),
	ap = AP,
	classes = 'source/classes.xml',
	version = TTF_VERSION,
	license = ofl('Lateef','SIL'),
	woff = woff('web/LateefGR-Regular.woff', params = '-v ' + VERSION + ' -m ../source/Lateef-WOFF-metadata.xml'),
	typetuner = 'source/typetuner.xml',
	)

AUTOGEN_TESTS = ['Empty', 'AllChars', 'DiacTest1', 'Mirrored', 'SubtendingMarks', 'DaggerAlef', 'Kern' ]

for testname in AUTOGEN_TESTS:
	t = create(testname + '.ftml', cmd('perl ${SRC[0]} -t ' + testname + ' -f l -r local(Scheherazade) -r local(Lateef) -r url(LateefGR-Regular.woff) ${SRC[1]} ${SRC[2]}', ['tools/bin/absGenFTML', 'source/LateefReg.ttf', AP, 'tools/absGlyphList/absGlyphList.txt']))
