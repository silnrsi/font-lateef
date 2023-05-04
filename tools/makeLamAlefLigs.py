#!/usr/bin/env python
'''for all UFOs in current folder, construct all desired lam-alef ligatures, being careful to preserve
anchors diaA, diaB, diaB2 and alef from the components.
For example, construct lam_alef-ar.fina from lam-ar.medi.preAlef and alef-ar.fina.postLamMed
'''
__copyright__ = 'Copyright (c) 2021-2022 SIL International  (https://www.sil.org)'
__license__ = 'Released under the MIT License (http://opensource.org/licenses/MIT)'
__author__ = 'Bob Hallissy'

from fontParts.world import OpenFont
from glob import glob


def addComponent(g, c, x, n):
    """ g = glyph object getting new component
        c = component glyph name
        x = x offset for new component in g
        n = ligature component index (1, 2, ...)
    """
    g.appendComponent(c, offset=(x, 0))
    for ac in g.layer[c].anchors:  # existing anchor in the component
        if ac.name in ('diaA', 'diaB', 'dia2B' 'alef'):
            g.appendAnchor(f'{ac.name}_{n}', (ac.x + x, ac.y))  # new anchor in ligature

ufoCount = 0

for ufo in glob('*.ufo'):
    font = OpenFont(ufo, showInterface=False)
    fontname = font.info.familyName
    stylename = font.info.styleName
    print(f'processing {ufo} = {fontname} {stylename}')
    ufoCount += 1

    # Keep track of glyphs added or modified:
    countAdded = 0
    countModified = 0

    # We're only going to process the default layer
    layer = font.defaultLayer

    # lams and alefs for which ligatures will be created
    # ToDo: maybe parameterize this? Or look up in glyph_data.csv?
    lams = ('lam', 'lamBar', 'lamDoublebar', 'lamDotabove', 'lamVabove', 'lamThreedotsabove', 'lamThreedotsbelow', 'lamTahabove')
    alefs = ('alef', 'alefWavyhamzaabove', 'alefWavyhamzabelow', 'alefWasla', 'alefTwoabove', 'alefThreeabove')
    # NB: highhamzaAlef is intentionally omitted as this char is never used word-final

    alefsSeen = set()  # Used so we only generate one "alef wanted" warning message per missing alef.

    for lam in lams:
        glam = f'{lam}-ar'
        if glam not in layer:
            print(f'{glam} wanted but not found in font {fontname} {stylename}')
            continue
        for alef in alefs:
            galef = f'{alef}-ar'
            if galef not in layer:
                if galefs not in alefsSeen:
                    print(f'{galef} wanted but not found in font {fontname} {stylename}')
                    alefsSeen.add(galef)
                continue

            # Ok, build two ligature glyphs:
            for ext in ('', '.fina'):
                gname = f'{lam}_{alef}-ar{ext}'
                if gname in layer:
                    print(f'replacing {gname}')
                    countModified += 1
                else:
                    print(f'adding {gname}')
                    countAdded += 1
                g = layer.newGlyph(gname, clear=True)
                if ext == '.fina':
                    l = f'{lam}-ar.medi.preAlef'
                    a = f'{alef}-ar.fina.postLamMed'
                else:
                    l = f'{lam}-ar.init.preAlef'
                    a = f'{alef}-ar.fina.postLamIni'

                lamWidth = int(layer[l].width)
                alefWidth = int(layer[a].width)

                addComponent(g, l, alefWidth, 1)
                addComponent(g, a, 0, 2)
                g.width = lamWidth + alefWidth

    print(f'{countAdded} glyphs added; {countModified} glyphs modified.')

    font.close(save=True)

print(f'{ufoCount} UFO fonts processed')
