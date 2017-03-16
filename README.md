# Lateef Graphite Font

Lateef is an extended Arabic script font designed by SIL International for
modern Unicode-based systems.

Named after Shah Abdul Lateef Bhitai, the famous Sindhi mystic and
poet, this font is intended to be an appropriate style for use in
Sindhi and other languages of the southern Asia.

## Project status [![Build Status](http://build.palaso.org/app/rest/builds/buildType:Fonts_Lateef/statusIcon)](http://build.palaso.org/viewType.html?buildTypeId=Fonts_Lateef&guest=1)  

This is an **unreleased development** effort currently focused on the following goals:

- Implement shaping behavior consistent with
[Lateef 1.001](http://www.sil.org/resources/software_fonts/lateef) but using [SIL Graphite](https://graphite.sil.org) technology rather than OpenType.
- Build the font using [SMITH](https://github.com/silnrsi/smith) toolchain.

See the FONTLOG.txt for information on this and previous releases.

## About ftml tests

After a successful build, the results folder will contain, along with the built ttf and woff fonts, a number of
test files in an xml-based format called FTML. Examples are AllChars.xml, DiacTest1.xml. 
There is, in the tools folder, an ftml.xsl file that can be used to view these ftml documents directly in Firefox (which supports
Graphite rendering). 

However, in order for Firefox to access the .xsl file, you need to relax its "strict URI" policy by going to about:config and
setting [security.fileuri.strict_origin_policy](http://kb.mozillazine.org/Security.fileuri.strict_origin_policy) to false.

Once you have this setting in effect, you can load the FTML documents directly into Firefox and see the built font rendered.

## License

Lateef is licensed under the SIL Open Font License. See OFL.txt and OFL-FAQ.txt for details.

## See also

For further information about this font, including Unicode ranges
supported, Graphite and OpenType font features and how to use them,
and licensing, please see the documentation on [the website](http://www.sil.org/resources/software_fonts/lateef) or in the documentation
subfolder of this font package.
