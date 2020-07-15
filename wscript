#! /usr/bin/python
# this is a smith configuration file

# set the default output folders
DOCDIR=['documentation', 'web']

# set package name
APPNAME='Lateef'

# set the font family name
FAMILY = APPNAME

# Get version info from Regular UFO; must be first function call:
getufoinfo('source/masters/' + FAMILY + '-Regular' + '.ufo')

# set up FTML tests
ftmlTest('tools/ftml.xsl')

# APs to omit:
omitaps = '--omitaps "_above _aboveLeft _below _center _ring _through above aboveLeft below center ring through"'

# location for misc build results
generated = 'generated/'

designspace('source/lateef-RB.designspace',
    instanceparams='-W -l ' + generated + '${DS:FILENAME_BASE}_createintance.log',
    target = process('${DS:FILENAME_BASE}.ttf',
##        cmd('psfchangettfglyphnames ${SRC} ${DEP} ${TGT}', ['source/masters/' + FAMILY + '-Regular' + '.ufo']),
        # cmd('${TTFAUTOHINT} -n -c  -D arab -W ${DEP} ${TGT}')
    ),
    classes = 'source/classes.xml',
    version = VERSION,  # Needed to ensure dev information on version string
    ap = generated + '${DS:FILENAME_BASE}.xml',

    graphite = gdl(generated + '${DS:FILENAME_BASE}.gdl',
        master = 'source/graphite/master.gdl',
        make_params = omitaps,
        depends = ['source/graphite/cp1252.gdl', 'source/graphite/features.gdh'],
        params = '-q -e ${DS:FILENAME_BASE}_gdlerr.txt',
        ),

##    opentype = fea(generated + '${DS:FILENAME_BASE}.fea',
##         master = 'source/opentype/master.feax',
##         make_params = OMITAPS,
##         params = '-m ' + generated + '${DS:FILENAME_BASE}.map',
##         ),
    script = 'arab', 
    pdf = fret(params='-r -oi'),
    woff = woff('web/${DS:FILENAME_BASE}.woff', params='-v ' + VERSION + ' -m "../source/' + FAMILY + '-WOFF-metadata.xml"'),
##    typetuner = typetuner('source/typetuner/feat_all.xml'),
    )

# def configure(ctx):
#    ctx.find_program('ttfautohint')
