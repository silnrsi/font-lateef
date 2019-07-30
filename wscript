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
generated = "generated/"

# set package name
APPNAME="Lateef"
DEBPKG = 'fonts-sil-lateef'

# set the font family name
FAMILY = APPNAME

# set licensing info
COPYRIGHT="Copyright (c) 2004-2019, SIL International (http://www.sil.org), with Reserved Font Names \"Harmattan\" and \"SIL\""
LICENSE='OFL.txt'

DESC_NAME = "Lateef"
DESC_SHORT = "An Arabic script font for Sindhi and other languages of southern Asia"

# Get version info from Regular UFO; must be first function call:
getufoinfo('source/masters/' + FAMILY + '-Regular' + '.ufo')


# set up the sile tests (using fontproof)
testCommand('sile', cmd='${SILE} --debug versions -o "${TGT}" "${SRC[0].abspath()}" -f "${SRC[1]}"', extracmds=['sile'], shapers=0, supports=['.sil'], ext='.pdf')


ftmlTest('tools/ftml.xsl')

# APs to omit:
omitaps = '--omitaps "_above _below _center _ring _through above below center ring through"'

designspace('source/lateef.designspace',
    shortcircuit = True,
    # params = '-l ${DS:FILENAME_BASE}_createintance.log',
    target = process('${DS:FILENAME_BASE}.ttf',
        # The following generates smith error: "source not found: 'instances/Lateef-Regular.ufo'" -- Not sure why.
        #cmd('${PSFCHANGETTFGLYPHNAMES} ${SRC} ${DEP} ${TGT}', ['${DS:FILENAME}']),
        cmd('${PSFCHANGETTFGLYPHNAMES} ${SRC} ${DEP} ${TGT}', ['source/masters/' + FAMILY + '-Regular' + '.ufo']),
        # cmd('${TTFAUTOHINT} -n -c  -D arab -W ${DEP} ${TGT}')
    ),
    classes = 'source/classes.xml',
    version = VERSION,
    license = ofl('Lateef','SIL'),
    ap = generated + '${DS:FILENAME_BASE}.xml',

    graphite = gdl(generated + '${DS:FILENAME_BASE}.gdl',
        master = 'source/graphite/master.gdl',
        make_params = omitaps,
        depends = ['source/graphite/cp1252.gdl', 'source/graphite/features.gdh'],
        params = '-q -e ${DS:FILENAME_BASE}_gdlerr.txt',
        ),

#   opentype = fea(generated + '${DS:FILENAME_BASE}.fea',
#        master = 'source/opentype/master.feax',
#        make_params = OMITAPS,
#        params = '-m ' + generated + '${DS:FILENAME_BASE}.map',
#        ),
 
    fret = fret(params='-r -oi'),
    woff = woff('web/${DS:FILENAME_BASE}.woff', params='-v ' + VERSION + ' -m ../source/${DS:FAMILYNAME}-WOFF-metadata.xml'),
#   typetuner = 'source/typetuner.xml',
    )

def configure(ctx):
    ctx.find_program('psfchangettfglyphnames')