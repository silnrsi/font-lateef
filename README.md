# Lateef

Lateef is an extended Arabic script font designed by SIL International for modern Unicode-based systems.

Named after Shah Abdul Lateef Bhitai, the famous Sindhi mystic and poet, this font is intended to be an appropriate style for use in Sindhi and other languages of the southern Asia.

## Project status [![Build Status](http://build.palaso.org/app/rest/builds/buildType:Fonts_Lateef/statusIcon)](http://build.palaso.org/viewType.html?buildTypeId=Fonts_Lateef&guest=1)  

**NOTE: This is an alpha version of a development font. It is not yet ready for wider use or distribution to end-users.**   
Font sources are published in a public repository and a smith open workflow is used for building, testing and releasing.   
You can contribute and report issues but please don't use this in production yet.

## Copyright and License
For copyright and licensing information - including any Reserved Font Names - see [OFL.txt](OFL.txt).

For practical information about using, modifying and redistributing this font see [OFL-FAQ.txt](OFL-FAQ.txt).

For more details about this project, including its design history and acknowledgements see [FONTLOG.txt](FONTLOG.txt).

## See also
For further information, including Unicode ranges supported, Graphite and OpenType font features 
and how to use them, please see the documentation on [software.sil.org/lateef](http://software.sil.org/lateef/)
or in the documentation subfolder.

# Developer notes

This project uses a UFO-based design and production workflow, with all sources in open formats and a completely open-source build toolkit. For more details see [SIL Font Development Notes](https://silnrsi.github.io/silfontdev/en-US/Introduction.html).

We welcome contributions to this font project, such as new glyphs, enhanced smart font code, or bug fixes. The best way to begin the process is to file an issue in the [Github project](https://github.com/silnrsi/font-lateef) or respond to an existing issue and express your interest. Then we can begin to correspond with you regarding what all might be required and discuss how to best submit your contributions.

To enable us to accept contributions in a way that honors your contribution and respects your copyright while preserving long-term flexibility for open source licensing, you would also need to agree to the SIL International Contributor License Agreement for Font Software (v1.0) prior to sending us your contribution. To read more about this requirement and find out how to submit the required form, please visit the [CLA information page](https://software.sil.org/fontcla).

## Building

The Lateef project can be built from source using [smith](https://github.com/silnrsi/smith). This is done via the sequence:
```
    smith distclean
    smith configure
    smith build
    smith alltests
```
For more details about the smith font build system, see the [SIL FontDev guide](https://silnrsi.github.io/silfontdev/).

Because of the relatively large GPOS table, such a build can take up to 15 minutes or longer, 
depending on hardware. If the GPOS kerning is _not_ needed (such as for regenerating certain 
source files, see below), the `--noOTkern` parameter can be supplied: 
```
    smith distclean
    smith configure
    smith build --noOTkern
```
The resulting files will not have functional OpenType kerning, but will be otherwise usable.

### Adding characters

After adding base characters to the font, the `classes.xml` file may need adjustment. The first eight
classes relating to right- and dual-link contextual forms can be generated algorithmically
using `source/glyph_data.csv` using `tools/bin/absgenclasses.py`.

Additionally the `*-octabox.json` files will need to be regenerated in order to add optimal 
octaboxes for the isolate and initial forms of the newly added characters. If unencoded variants
of isolate and initial forms have been added, these must be manually added to the `cComplexShape`
class defined in `source/graphite/caBasedKerning.gdl` so they get optimized as well.

### Generated test files

After adding characters or additional behaviors to the font, test files should be created or enhanced to test the new behaviors. These test files:
- `tests/AllChars.ftml` 
- `tests/ALsorted.ftml`
- `tests/DiacTest1.ftml`
- `tests/DiacTest1-short.ftml`
- `tests/SubtendingMarks.ftml`
- `tests/DaggerAlef.ftml`
- `tests/Kern.ftml`
- `tests/Yehbarree.ftml`      
- `tests/FeatLang.ftml`

are algorithmically generated and so can be updated by `tools/bin/genftmlfiles.sh`.

### Generated source files

Some of the source files needed for the build are actually generated files but, because they 
require compute-intensive tools to create or update, are generated offline and committed 
to the repo. The files that fall into this category are:
- `source/kerndata.ftml` — contains strings with all possible combinations of reh-like and 
following initials or isolates. This is used to extract graphite collision-avoidance-based 
kerning data.
- `source/*-octabox.json` — optimized octaboxes to enable Graphite to do more accurate kerning 
of reh-like characters to what follows.
- `source/opentype/*-caKern.fea` — contextual kerning rules that approximate the kerning effected
by the Graphite collision avoidance.

If the _design_ of any Arabic glyphs in the font changes, it is important to rebuild the 
optimized octabox.json files so that Graphite collision-avoidance-based kerning is accurate, 
and then to rebuild the OpenType kerning rules from the graphite results. A script to do this 
is in `tools/bin/updateKerning.sh`. This should be run from the root of the project. Be aware
this can take up to 30 minutes or more to complete.

Important notes: The `updateKerning.sh` tool requires:
- fully functioning [`smith`](https://github.com/silnrsi/smith) build system
- a Graphite-enabled Harfbuzz library
- a Graphite library with tracing enabled. The library provided by default Ubuntu
does not include tracing. You'll need to compile the source with -DGRAPHITE2_NTRACING:BOOL=OFF 
- the [scikit-learn](https://scikit-learn.org/) python module. For ubuntu try:
```
sudo apt-get install python3-sklearn python3-sklearn-lib
```

## About ftml tests

The `tests/` folder contains a number of test files in an xml-based format called FTML.
Examples are AllChars.xml, DiacTest1.xml. 
There is, in the tools folder, an ftml.xsl file that can be used to view these ftml documents directly in Firefox (which supports Graphite rendering). 

However, in order for Firefox to access the .xsl file, you need to relax its "strict URI" policy by going to about:config and
setting [security.fileuri.strict_origin_policy](http://kb.mozillazine.org/Security.fileuri.strict_origin_policy) to false.

Once you have this setting in effect, you can load the FTML documents directly into Firefox and see the built fonts rendered.
