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
omitaps = '--omitaps "_above _aboveLeft _below _center _ring _through above aboveLeft below center ring through entry exit"'

# location for misc build results
generated = 'generated/'

# smith project-specific options:
#   --autohint - autohint the font
#   --norename - do not include glyph rename step
#   --regOnly  - build just Lateef-Regular
#   --noOTkern - omit CA-based kerning from OpenType
#   --graphite - add graphite smarts font for kerning update purposes (otherwise font is OT-only)

opts = preprocess_args({'opt': '--autohint'}, {'opt': '--norename'}, {'opt': '--noOTkern'}, {'opt': '--regOnly'}, {'opt': '--graphite'})

cmds = [cmd('ttx -m ${DEP} -o ${TGT} ${SRC}', ['source/jstf.ttx'])]
typetunerfile = 'source/typetuner/feat_all-nographite.xml'
extras = {}
if '--graphite' in opts:
    # If we're going to include graphite, then we also need to invoke octalap to get optimized octaboxes 
    # and a different typetuner source file.
    cmds.append(cmd('${OCTALAP} -m ${SRC} -o ${TGT} ${DEP}', 'source/graphite/${DS:FILENAME_BASE}-octabox.json'))
    typetunerfile = 'source/typetuner/feat_all.xml'
    extras['graphite'] = gdl(generated + '${DS:FILENAME_BASE}.gdl',
        master = 'source/graphite/master.gdl',
        make_params = omitaps + ' --cursive "exit=entry,rtl" --cursive "digitR=digitL"',
        depends = ['source/graphite/caBasedKerning.gdl', 
                   'source/graphite/cp1252.gdl', 
                   'source/graphite/features.gdh', 
                   'source/graphite/glyphs.gdh'],
        params = '-q -e ${DS:FILENAME_BASE}_gdlerr.txt',
        ) 

if '--norename' not in opts:
    cmds.append(cmd('psfchangettfglyphnames ${SRC} ${DEP} ${TGT}', ['source/instances/${DS:FILENAME_BASE}.ufo']))

if '--autohint' in opts:
    # Note: in some fonts ttfautohint-generated hints don't maintain stroke thickness at joins; test thoroughly
    cmds.append(cmd('${TTFAUTOHINT} -n -c  -D arab -W ${DEP} ${TGT}'))

if '--noOTkern' in opts:
    noOTkern = ' -D noOTkern=yes'
    OTdepends = []
else:
    noOTkern = ''
    OTdepends = ['source/opentype/${DS:FILENAME_BASE}-caKern.fea']

designspace('source/lateef.designspace',
    instanceparams='-l ' + generated + '${DS:FILENAME_BASE}_createintance.log',
    instances = ['Lateef Regular'] if '--regOnly' in opts else None,
    target = process('${DS:FILENAME_BASE}.ttf', *cmds),
    classes = 'source/classes.xml',
    version = VERSION,  # Needed to ensure dev information on version string
    ap = generated + '${DS:FILENAME_BASE}.xml',
    opentype = fea(generated + '${DS:FILENAME_BASE}.fea',
        mapfile = generated + '${DS:FILENAME_BASE}.map',
        master = 'source/opentype/${DS:FILENAME_BASE}.feax',
        depends = ['source/opentype/gsub.feax',
                   'source/opentype/gpos.feax',
                  ] + OTdepends,
        make_params = omitaps + noOTkern,
        params = '-m ' + generated + '${DS:FILENAME_BASE}.map',
        ),
    script = 'arab', 
    pdf = fret(params='-b -r -oi'),
    woff = woff('web/${DS:FILENAME_BASE}', 
        metadata='../source/${DS:FAMILYNAME_NOSPC}-WOFF-metadata.xml',
        ),
    typetuner = typetuner(typetunerfile),
    **extras)

def configure(ctx):
    ctx.find_program('ttfautohint')
    ctx.find_program('octalap', mandatory=False)
