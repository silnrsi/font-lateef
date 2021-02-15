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
omitaps = '--omitaps "_above _aboveLeft _below _center _ring _through above aboveLeft below center ring through entry exit"'

# location for misc build results
generated = 'generated/'

# smith project-specific options:
#   --autohint - autohint the font
#   --rename   - include glyph rename step   ## ToDo:  change to --norename when we're far enough along
#   --regOnly  - build just Lateef-Regular
opts = preprocess_args({'opt': '--autohint'}, {'opt': '--norename'}, {'opt': '--regOnly'})

cmds = [cmd('ttx -m ${DEP} -o ${TGT} ${SRC}', ['source/jstf.ttx'])]
if '--norename' not in opts: ## ToDo:  change to --norename when we're far enough along
    cmds.append(cmd('psfchangettfglyphnames ${SRC} ${DEP} ${TGT}', ['source/instances/${DS:FILENAME_BASE}.ufo']))
if '--autohint' in opts:
    # Note: in some fonts ttfautohint-generated hints don't maintain stroke thickness at joins; test thoroughly
    cmds.append(cmd('${TTFAUTOHINT} -n -c  -D arab -W ${DEP} ${TGT}'))
dspace_file = 'source/lateef-RB.designspace' if '--regOnly' not in opts else 'source/lateef-RegOnly.designspace'

designspace(dspace_file,
    instanceparams='-W -l ' + generated + '${DS:FILENAME_BASE}_createintance.log',
    target = process('${DS:FILENAME_BASE}.ttf', *cmds),
    classes = 'source/classes.xml',
    version = VERSION,  # Needed to ensure dev information on version string
    ap = generated + '${DS:FILENAME_BASE}.xml',

    graphite = gdl(generated + '${DS:FILENAME_BASE}.gdl',
        master = 'source/graphite/master.gdl',
        make_params = omitaps + ' --cursive "exit=entry,rtl" --cursive "digitR=digitL"',
        depends = ['source/graphite/cp1252.gdl', 'source/graphite/features.gdh'],
        params = '-q -e ${DS:FILENAME_BASE}_gdlerr.txt',
        ),

    opentype = fea(generated + '${DS:FILENAME_BASE}.fea',
         mapfile = generated + '${DS:FILENAME_BASE}.map',
         master = 'source/opentype/master.feax',
         make_params = omitaps,
         params = '-m ' + generated + '${DS:FILENAME_BASE}.map',
         ),
    script = 'arab', 
    pdf = fret(params='-r -oi'),
    # woff = woff('web/${DS:FILENAME_BASE}.woff', params='-v ' + VERSION + ' -m "../source/' + FAMILY + '-WOFF-metadata.xml"'),
    # woff = woff('web/${DS:FILENAME_BASE}.woff', cmd='psfwoffit -m "../source/' + FAMILY + '-WOFF-metadata.xml" --woff ${TGT} --woff2 web/${DS:FILENAME_BASE}.woff2 ${SRC}'),
    woff = woff('web/${DS:FILENAME_BASE}.woff',
        metadata=f'../source/{FAMILY}-WOFF-metadata.xml',
        cmd='psfwoffit -m ${SRC[1]} --woff ${TGT} --woff2 ${TGT}2 ${SRC[0]}'
        ),
    typetuner = typetuner('source/typetuner/feat_all.xml'),
    )

def configure(ctx):
    ctx.find_program('ttfautohint')
