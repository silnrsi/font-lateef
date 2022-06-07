#!/usr/bin/env python
'generate linking classes for abs projects from glyph_data.csv'
__url__ = 'http://github.com/silnrsi/pysilfont'
__copyright__ = 'Copyright (c) 2018-2022 SIL International  (http://www.sil.org)'
__license__ = 'Released under the MIT License (http://opensource.org/licenses/MIT)'
__author__ = 'Bob Hallissy'

import re
from silfont.core import execute
from palaso.unicode.ucd import get_ucd

argspec = [
    ('ifont',{'help': 'Input UFO'}, {'type': 'infont'}),
    ('output',{'help': 'Output classes in XML format'}, {'type': 'outfile', 'def': '_gen_classes.xml'}),
    ('-i','--input',{'help': 'Glyph info csv file'}, {'type': 'incsv', 'def': 'glyph_data.csv'}),
    ('-l','--log',{'help': 'Set log file name'}, {'type': 'outfile', 'def': '_classes.log'}),
    ('--LAparts', {'help': 'include classes for lam-alef ligature parts', 'action': 'store_true'},{}),
]

# UTR53 Modifier Combining Marks (from https://www.unicode.org/reports/tr53/)
mcm = {
    0x0654, # ARABIC HAMZA ABOVE
    0x0655, # ARABIC HAMZA BELOW
    0x0658, # ARABIC MARK NOON GHUNNA
    0x06DC, # ARABIC SMALL HIGH SEEN
    0x06E3, # ARABIC SMALL LOW SEEN
    0x06E7, # ARABIC SMALL HIGH YEH
    0x06E8, # ARABIC SMALL HIGH NOON
    0x08CA, # ARABIC SMALL HIGH FARSI YEH
    0x08CB, # ARABIC SMALL HIGH YEH BARREE WITH TWO DOTS BELOW
    0x08CD, # ARABIC SMALL HIGH ZAH
    0x08CE, # ARABIC LARGE ROUND DOT ABOVE
    0x08CF, # ARABIC LARGE ROUND DOT BELOW    
    0x08D3, # ARABIC SMALL LOW WAW
    0x08F3, # ARABIC SMALL HIGH WAW
}


def doit(args):
    logger = args.logger

    # Iterate over glyph_data file looking for:
    #   Encoded glyphs whose USV shows they are Right- or Dual-joining
    #     Warn if their name has an extension
    #     Keep a list of right-joining and a list of dual-joining
    #  Arabic mark glyphs
    #     Keep lists needed for UTF53 processing
    #

    # For all glyphs:
    basename2uid = {}   # Mapping basename to USV for encoded chars
    ligature2uids = {}  # Mapping basename to USV list for ligatures
    glyphOrder = {}     # dictionary to record sort order of glyphs
    ufomissing = set()  # glyphs mentioned or needed in csv that aren't in UFO

    # Sets needed for class generation
    rjoining = set()    # names of all right-joining encoded glyphs
    djoining = set()    # names of all dual-joining encoded glyphs
    lams = set()        # lam-like
    alefs = set()       # alef-like
    rehs = set()        # reh-like
    waws = set()        # waw-like
    takesLargeAlef = set()  # has bowl (final yehs, seens, etc)

    # Sets of mark glyphs needed for UTR53
    utr53_220MCM = set()
    utr53_230MCM = set()
    utr53_shadda = set()
    utr53_fixedPos = set()
    utr53_alef = set()
    utr53_220other = set()
    utr53_230other = set()

    def splitgname(gname):
        '''split a glyph name into base and extension (possibly None) unless the name starts with '.' '''
        p = gname.find('.')
        return (gname, None) if p <= 0 else (gname[0:p], gname[p:])

    def addMark(gname, uid):
        '''accumulate sets of mark glyphs based on combining class and MCM status'''
        ccc = int(get_ucd(uid, 'ccc'))
        if uid in (mcm):
            if ccc == 220:
                utr53_220MCM.add(gname)
            elif ccc == 230:
                utr53_230MCM.add(gname)
            else:
                logger.log(f'glyph {gname} (uid {uid:04X}) claims to be MCM but has ccc {ccc}', 'S')
        elif ccc == 33:
            utr53_shadda.add(gname)
        elif ccc > 0 and ccc < 35:
            utr53_fixedPos.add(gname)
        elif ccc == 35:
            utr53_alef.add(gname)
        elif ccc == 220:
            utr53_220other.add(gname)
        elif ccc == 230:
            utr53_230other.add(gname)
        elif ccc != 0:
            # warn about anything else other than cgj and VS1-VS16
            logger.log(f'unexpected glyph {gname} with uid {uid:04X} and ccc {ccc}; glyph ignored', 'W')

    def addToClasses(gname, uid, basename, ext, encoded):
        ''' given a glyph with its information, add it to needed classes'''
        # Note that if the glyph is not encoded, the uid will be that of the encoded variant of it.
        # Ignore anything outside of arabic blocks
        if  get_ucd(uid, 'blk').startswith('Arabic'):
            jt = get_ucd(uid, 'jt')
            jg = get_ucd(uid, 'jg')
            if jt == 'R' and encoded:
                rjoining.add(gname)
                if jg == 'Alef':
                    alefs.add(gname)
            elif jt == 'D' and encoded:
                djoining.add(gname)
                if jg == 'Lam':
                    lams.add(gname)
            elif get_ucd(uid, 'bc') == 'NSM':
                # Partition up the marks for pseudo UTR53
                addMark(gname, uid)
            if jg in ('Yeh','Farsi_Yeh', 'Yeh_With_Tail', 'Seen','Sad',) and ext in (None, ".fina"):
                takesLargeAlef.add(gname)
            elif jg == 'Reh':
                rehs.add(gname)
            elif jg == 'Waw':
                waws.add(gname)

            if gname not in args.ifont:
                ufomissing.add(gname)

    def makeLines(glist, padding = 0):
        '''break list of glyphnames into lines for output'''
        lines = []
        while len(glist):
            line = []
            linelgt = 0
            while len(glist) and linelgt < 120:
                gname = glist.pop(0)
                line.append(gname)
                linelgt += len(gname) + 1 + padding # Allow for space in between, and .xxxx extension
            if len(line):
                lines.append(line)
        return lines

    def outputMatchingClasses(cname, glist, related = None):
        '''output a class, or group of related classes, checking glyph orders'''
        # cname = name of first (possibly only) class to output
        # glist = list of glyph names of the first class
        # related = list of 2-tuples that identify classes that should parallel the first class in correct order
        #    each tuple contains (rname, extension) where
        #        rname = name of the related class
        #        extension = glyphname extension to add to members of cname (e.g., ".init")
        numClasses = 1 if related is None else 1+len(related)
        if numClasses == 1:
            padding = 0
        else:
            # Lots of work to do in in dealing with related classes (e.g., right-joining and their finals):
            # preliminaries:
            args.output.write(f'    <!-- *NEXT {numClasses} CLASSES MUST MATCH* -->\n\n')
            # Classes will be linewrapped such that the same glyph names appear in each line of the related classes.
            # To do this we need to know what the longest extension is in the related classes and account for it
            # when linewrapping the first class.
            padding = max(len(r[1]) for r in related)
            # sort glist by glyphorder:
            glist = sorted(glist, key=lambda x: glyphOrder[x])
            # for each related class, verify the corresponding glyphs are present and in the same glyph order in the font
            for r in related:
                (rname, ext) = r
                rlist = (f'{x}{ext}' for x in glist)
                # Check for missing or out-of-order glyphs
                lastGlyphOrder = None
                csvmissing = set()
                outOfOrder = set()
                for gname in rlist:
                    try:
                        myOrder = glyphOrder[gname]
                        if lastGlyphOrder is not None and myOrder <= lastGlyphOrder:
                            outOfOrder.add(gname)
                        lastGlyphOrder = myOrder
                    except KeyError:
                        csvmissing.add(gname)
                    if gname not in args.ifont:
                        ufomissing.add(gname)
                if len(csvmissing):
                    logger.log(f'CSV is missing glyphs for class {rname}: {" ".join(sorted(csvmissing))}', 'E')
                if len(outOfOrder):
                    logger.log(f'Out of order glyphs for class {rname}: {" ".join(sorted(outOfOrder))}', 'E')
        # finally we can output classes, with glyphs in alphabetical order
        glist = sorted(glist)
        lines = makeLines(glist, padding)
        s = ' ' if numClasses == 1 else f': 1 of {numClasses} '
        args.output.write(f"    <class name='{cname}'>    <!-- autogenerated{s}-->\n")
        for line in lines:
            args.output.write(f"        {' '.join(line)}\n")
        args.output.write("    </class>\n\n")
        if numClasses > 1:
            for i,r in enumerate(related):
                (rname, ext) = r
                args.output.write(f"    <class name='{rname}'>    <!-- autogenerated: {i+2} of {numClasses} -->\n")
                for line in lines:
                    args.output.write(f"        {' '.join(f'{x}{ext}' for x in line)}\n")
                args.output.write("    </class>\n\n")


    # Get headings from csvfile:
    incsv = args.input
    fl = incsv.firstline
    if fl is None: logger.log("Empty input file", "S")
    # required columns:
    try:
        nameCol = fl.index('glyph_name');
        usvCol = fl.index('USV')
        orderCol = fl.index('DesignerOrder')
    except ValueError as e:
        logger.log('Missing csv input field: ' + e.message, 'S')
    except Exception as e:
        logger.log('Error reading csv input field: ' + e.message, 'S')
    next(incsv.reader, None)  # Skip first line with headers in

    # RE that matches USV sequences for ligatures
    ligatureRE = re.compile('^[0-9A-Fa-f]{4,6}(?:_[0-9A-Fa-f]{4,6})+$')
    
    # RE that matches space-separated USV sequences
    USVsRE = re.compile('^[0-9A-Fa-f]{4,6}(?:\s+[0-9A-Fa-f]{4,6})*$')

    # Process all records in glyph_data
    for line in incsv:
        gname = line[nameCol].strip()

        # things to ignore:
        if len(gname) == 0:
            logger.log('empty glyph name in glyph_data; ignored', 'W')
            continue
        if re.match('[#._]|nonmarkingreturn|tab|absAutoKashida', gname):
            continue

        # remember glyph ordering for all glyphs
        glyphOrder[gname] = float(line[orderCol])
        # split gname
        basename, ext = splitgname(gname)

        # Process USV
        # could be empty string, or an underscore- or space-separated list of USVs
        usvs = line[usvCol].strip()
        if len(usvs) == 0:
            # Empty USV field, unencoded glyph
            usvs = ()
        elif USVsRE.match(usvs):
            # space-separated hex values:
            usvs = usvs.split()
            isLigature = False
        elif ligatureRE.match(usvs):
            # '_' separated hex values (ligatures)
            usvs = usvs.split('_')
            isLigature = True
        else:
            self._csvWarning(f"invalid USV field '{usvs}'; ignored")
            usvs = ()
        uids = [int(x, 16) for x in usvs]

        if len(uids) == 0:
            # Handle unencoded glyphs
            # for now we're ignoring variants of ligatures:
            if basename in ligature2uids:
                continue
            # for everything else, we should have seen the encoded variant already,
            # so act based on its uid:
            try:
                uid = basename2uid[basename]
                addToClasses(gname, uid, basename, ext, False)
            except KeyError:
                logger.log(f'cannot determine USV for unencoded glyph {gname}; glyph ignored', 'E')
        elif not isLigature:
            # Handle simple encoded glyphs
            # TODO: What should we do if glyph has multiple encodings? Right now just take first
            uid = uids[0]
            basename2uid[basename] = uid
            if ext is not None:
                logger.log(f'encoded glyph {gname} has extensions -- be sure to check construction of variant forms', 'E')
            addToClasses(gname, uid, basename, ext, True)
        else:
            # Handle ligature glyphs
            ligature2uids[basename] = uids
            # otherwise, for now, we're ignoring ligatures

    # Now output everything, even if missing or out of order

    args.output.write('\n    <!-- ***** NB: The following classes were generated algorithmically \n'
                        '                   based on Unicode properties (see tools/absgenclasses.py) ***** -->\n\n')

    args.output.write('\n    <!--\n' 
        '    ===============================\n'
        '    Linking form\n' 
        '    ===============================\n'
        '    -->\n')

    outputMatchingClasses('DualLinkIsol', djoining,
                          (('DualLinkInit', '.init'), ('DualLinkMedi', '.medi'), ('DualLinkFina', '.fina')))
    outputMatchingClasses('RightLinkIsol', rjoining,
                          (('RightLinkFina', '.fina'),))
    
    if args.LAparts:
        outputMatchingClasses('LamIso', lams,
                            (('LamIni', '.init'), ('LamMed', '.medi'), ('LamFin', '.fina'),
                            ('LamIniBeforeAlef', '.preAlef.init'), ('LamMedBeforeAlef', '.preAlef.medi')))
        outputMatchingClasses('AlefIso', alefs,
                            (('AlefFin', '.fina'),
                            ('AlefFinAfterLamIni', '.postLamIni.fina'), ('AlefFinAfterLamMed', '.postLamMed.fina')))
    else:
        outputMatchingClasses('LamIso', lams,
                            (('LamIni', '.init'), ('LamMed', '.medi'), ('LamFin', '.fina')))
        outputMatchingClasses('AlefIso', alefs,
                            (('AlefFin', '.fina'),))
        
    # the UTR53 classes:
    args.output.write('\n    <!--\n' 
        '    ===============================\n'
        '    For pseudo-UTR53 implementation\n' 
        '    ===============================\n'
        '    -->\n')

    for clname, glist in zip(('UTR53_220MCM', 'UTR53_230MCM', 'UTR53_shadda', 'UTR53_fixedPos', 'UTR53_alef', 'UTR53_220other', 'UTR53_230other'),
                             (utr53_220MCM, utr53_230MCM, utr53_shadda, utr53_fixedPos, utr53_alef, utr53_220other, utr53_230other)):
        outputMatchingClasses(clname, glist)

    args.output.write('\n    <!--\n' 
        '    ===============================\n'
        '    Miscellaneous\n' 
        '    ===============================\n'
        '    -->\n\n')

    outputMatchingClasses('takesLargeAlef', takesLargeAlef)
    outputMatchingClasses('RehAll', rehs)
    outputMatchingClasses('WawAll', waws)

    args.output.close


    if len(ufomissing):
        logger.log(f'UFO is missing glyphs: {" ".join(sorted(ufomissing))}', 'E')

    logger.log(f'Classes written to "{args.output.name}". Not all that were output are necessarily needed ' +
               'in every project; manually copy those that are into source/classes.xml.', 'P')

def cmd() : execute('FP',doit,argspec)
if __name__ == "__main__": cmd()
