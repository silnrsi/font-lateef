#! /usr/bin/python
# this is a smith configuration file

# set the default output folders
out="results"
DOCDIR="documentation"
OUTDIR="installers"
ZIPDIR="releases"
TESTDIR='tests'
TESTRESULTSDIR = 'results/tests'
STANDARDS = 'standards'

# set the font name, version, licensing and description
APPNAME="LateefGR"
VERSION="1.200"
COPYRIGHT="Copyright (c) 2004-2016, SIL International (http://www.sil.org)"
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

DEBPKG = 'fonts-sil-lateef'

AP = 'source/LateefReg_tmp.xml'

font(target = process('LateefGR-Regular.ttf', name('LateefGR')),
	source = 'source/LateefReg.ttf',
	graphite = gdl('Lateef-Regular.gdl',
		master = 'source/master.gdl',
		make_params = '--package "zork.pm" -o "_above _below _center _ring _through above below center ring through"  --classprops'),
	ap = AP,
	classes = 'source/classes.xml',
	version = VERSION,
	license = ofl('Lateef','SIL'),
	woff = woff(),
	)

AUTOGEN_TESTS = ['Empty', 'AllChars', 'DiacTest1', 'Mirrored', 'SubtendingMarks' ]

for testname in AUTOGEN_TESTS:
	t = create(testname + '.xml', cmd('perl ${SRC[0]} -t ' + testname + ' -f l -r local(Lateef) ${SRC[1]} ${SRC[2]}', ['tools/bin/absGenFTML', 'results/LateefGR-Regular.ttf', AP]))

def configure(ctx) :
    ctx.env['MAKE_GDL'] = 'perl -I ../tools/perllib ../tools/bin/make_gdl'