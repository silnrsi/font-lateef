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
ftmlTest('tools/ftml-smith.xsl')

# APs to omit:
omitaps = '--omitaps "_above _aboveLeft _below _center _ring _through above aboveLeft below center ring through entry exit alefUnused"'

# location for misc build results
generated = 'generated/'

# smith project-specific options:
#   --autohint - autohint the font
#   --norename - do not include glyph rename step
#   --regOnly  - build just Lateef-Regular

opts = preprocess_args({'opt': '--autohint'}, {'opt': '--norename'}, {'opt': '--regOnly'})

cmds = [cmd('ttx -m ${DEP} -o ${TGT} ${SRC}', ['source/jstf.ttx'])]

if '--norename' not in opts:
    cmds.append(cmd('psfchangettfglyphnames ${SRC} ${DEP} ${TGT}', ['${source}']))

if '--autohint' in opts:
    # Note: in some fonts ttfautohint-generated hints don't maintain stroke thickness at joins; test thoroughly
    cmds.append(cmd('${TTFAUTOHINT} -n -c  -D arab -W ${DEP} ${TGT}'))

designspace('source/lateef.designspace',
    instanceparams='-l ' + generated + '${DS:FILENAME_BASE}_createintance.log',
    instances = ['Lateef Regular'] if '--regOnly' in opts else None,
    params = '-c ^_',
    target = process('${DS:FILENAME_BASE}.ttf', *cmds),
    classes = 'source/classes.xml',
    version = VERSION,  # Needed to ensure dev information on version string
    # ap = generated + '${DS:FILENAME_BASE}.xml',
    opentype = fea(generated + '${DS:FILENAME_BASE}.fea',
        mapfile = generated + '${DS:FILENAME_BASE}.map',
        master = 'source/opentype/main.feax',
        make_params = '--ignoreglyphs ' + omitaps,
        depends = ['source/opentype/gsub.feax', 'source/opentype/gpos.feax',
                   'source/opentype/customCollisionSubs.feax',
                   'source/opentype/customKerning.feax',
                   'source/opentype/customShaping.feax',
                   'source/opentype/customShifting.feax',
                   'source/opentype/oldStyleKerning.feax'],
        ),
    script = 'arab', 
    pdf = fret(params='-b -r -oi'),
    woff = woff('web/${DS:FILENAME_BASE}', 
        metadata=f'../source/{FAMILY}-WOFF-metadata.xml',
        ),
    typetuner = typetuner('source/typetuner/feat_all.xml'),
    )

def configure(ctx):
    ctx.find_program('ttfautohint')
