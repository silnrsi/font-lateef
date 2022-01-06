#!/usr/bin/python3
''' Rewrites the raw kerning data output from grkern2fea -e graphite to remove zwj '''

# Copyright (c) 2020-2022 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

import re
import sys

ignoreRE = re.compile(r'\[(?:madda|hamzaabove|hamzabelow)')
indexRE = re.compile(r'!\d+')

with open(sys.argv[1]) as fin:
    with open(sys.argv[2], 'w') as fout:
        for line in fin:
            # If line includes "madda" or "hamza" (from alef decompositions) ignore it:
            if ignoreRE.search(line):
                continue
            # Split on whitespace into "words"
            l = line.split()
            # pop first word (the quoted string) and save for later:
            qstr = l.pop(0)
            # filter remainder to remove zerowidthjoiners and renumber what's left:
            l = [indexRE.sub(f'!{i}', slot) for i,slot in enumerate(filter(lambda x: not x.startswith('[zerowidthjoiner]'), l))]
            l = [indexRE.sub(f'!{i}', slot) for i,slot in enumerate(filter(lambda x: not x.startswith('[uni200D]'), l))]
            # output the results
            print(qstr, ' '.join(l), file=fout)
