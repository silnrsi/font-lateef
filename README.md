# Lateef

Lateef is an extended Arabic script font designed by SIL International for modern Unicode-based systems.

Named after Shah Abdul Lateef Bhitai, the famous Sindhi mystic and poet, this font is intended to be an appropriate style for use in Sindhi and other languages of the southern Asia.

## Project status [![Build Status](http://build.palaso.org/app/rest/builds/buildType:Fonts_Lateef/statusIcon)](http://build.palaso.org/viewType.html?buildTypeId=Fonts_Lateef&guest=1)  

Lateef v2.000 has been released. We will be releasing maintenance updates to fix bugs.

## Copyright and License
For copyright and licensing information - including any Reserved Font Names - see [OFL.txt](OFL.txt).

For practical information about using, modifying and redistributing this font see [OFL-FAQ.txt](OFL-FAQ.txt).

For more details about this project, including its design history and acknowledgements see [FONTLOG.txt](FONTLOG.txt).

## See also
For further information, including Unicode ranges supported, OpenType font features 
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
See all the details in the [SIL FontDev guide](https://silnrsi.github.io/silfontdev/).

## About ftml tests

After a successful build, the results folder will contain, along with the built ttf and woff fonts, a number of
test files in an xml-based format called FTML. Examples are AllChars.xml, DiacTest1.xml. 
There is, in the tools folder, an ftml.xsl file that can be used to view these ftml documents directly in Firefox. 

However, in order for Firefox to access the .xsl file, you need to relax its "strict URI" policy by going to about:config and
setting [security.fileuri.strict_origin_policy](http://kb.mozillazine.org/Security.fileuri.strict_origin_policy) to false.

Once you have this setting in effect, you can load the FTML documents directly into Firefox and see the built font rendered.
