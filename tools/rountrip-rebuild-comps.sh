#!/bin/bash
# Copyright (c) 2020-2022 SIL International  (http://www.sil.org)
# Released under the MIT License (http://opensource.org/licenses/

# Round-trip from Glyphs to UFO, rebuild composites, and convert from UFO back to Glyphs
# 2020-11-04 pm

# Glyphs to UFO
./preflightg

# Rebuild composites
cd source/masters/
../../tools/rebuild_comps.sh

# UFO to Glyphs
cd ../..
./preglyphs

# Open in Glyphs
open source/masters/Lateef.glyphs