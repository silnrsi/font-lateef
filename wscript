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
#   --graphite - add graphite smarts font for kerning update purposes (otherwise font is OT-only)

opts = preprocess_args({'opt': '--autohint'}, {'opt': '--norename'}, {'opt': '--regOnly'}, {'opt': '--graphite'})

cmds = [cmd('ttx -m ${DEP} -o ${TGT} ${SRC}', ['source/jstf.ttx'])]
extras = {}
if '--graphite' in opts:
    # If we're going to include graphite, then we need a different typetuner source file.
    typetunerfile = 'source/typetuner/feat_all.xml'
    extras['graphite'] = gdl(generated + '${DS:FILENAME_BASE}.gdl',
        master = 'source/graphite/main.gdl',
        make_params = omitaps + ' --cursive "exit=entry,rtl" --cursive "digitR=digitL"',
        depends = ['source/graphite/cp1252.gdl', 
                   'source/graphite/features.gdh', 
                   'source/graphite/glyphs.gdh'],
        params = '-q -e ${DS:FILENAME_BASE}_gdlerr.txt',
        ) 
else:
    # Without grahite, we use a subset of the typetuner file that contains no graphite table manipulation
    typetunerfile = create(generated + '${DS:FILENAME_BASE}-feat_all.xml', cmd('grep -v "gr_" ${SRC} > ${TGT}', ['source/typetuner/feat_all.xml']))

if '--norename' not in opts:
    cmds.append(cmd('psfchangettfglyphnames ${SRC} ${DEP} ${TGT}', ['${source}']))

if '--autohint' in opts:
    # Note: in some fonts ttfautohint-generated hints don't maintain stroke thickness at joins; test thoroughly
    cmds.append(cmd('${TTFAUTOHINT} -n -c  -D arab -W ${DEP} ${TGT}'))

designspace('source/lateef.designspace',
    instanceparams='-l ' + generated + '${DS:FILENAME_BASE}_createintance.log',
    instances = ['Lateef Regular'] if '--regOnly' in opts else None,
    target = process('${DS:FILENAME_BASE}.ttf', *cmds),
    classes = 'source/classes.xml',
    version = VERSION,  # Needed to ensure dev information on version string
    ap = generated + '${DS:FILENAME_BASE}.xml',
    opentype = fea(generated + '${DS:FILENAME_BASE}.fea',
        mapfile = generated + '${DS:FILENAME_BASE}.map',
        master = 'source/opentype/main.feax',
        make_params = omitaps,
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
    typetuner = typetuner(typetunerfile),
    **extras
    )

def configure(ctx):
    ctx.find_program('ttfautohint')
