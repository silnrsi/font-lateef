---
title: Lateef - Announcement
fontversion: 4.400
---

We are very pleased to announce a new release of Lateef, a font intended to be an appropriate style for use in Sindhi and other languages of the South Asian region.

### Changes

This release includes the following changes for this version:

#### New

- Added:
  - 088F ARABIC LETTER NOON WITH RING ABOVE
  - FBC6 ARABIC LIGATURE RAHMATU ALLAAHI ALAYHIM 
  - FBC7 ARABIC LIGATURE RAHMATU ALLAAHI ALAYHIMAA 
  - FD90 ARABIC LIGATURE RAHMATU ALLAAHI ALAYH 
  - FD91 ARABIC LIGATURE RAHMATU ALLAAHI ALAYHAA 
  - 10EC5 ARABIC SMALL YEH BARREE WITH TWO DOTS BELOW 
  - 10EC6 ARABIC LETTER THIN NOON 
  - 10EC7 ARABIC LETTER YEH WITH FOUR DOTS BELOW 
  - 10ED0 ARABIC BIBLICAL END OF VERSE 
  - 10EFA ARABIC DOUBLE VERTICAL BAR BELOW 
  - 10EFB ARABIC SMALL LOW NOON 
- Added cv88 (Guillemet) to provide a choice for angled guillemot characters in Arabic script
- Added Malay Jawi language support

#### Improved

- Added width to 08AD ARABIC LETTER LOW ALEF
- Improved positioning of below marks on 0674 ARABIC LETTER HIGH HAMZA
- Added sample strings and feature tooltips to the character variants for applications that support them

#### Known issues

- Shaping for the newly added characters may not yet occur in applications.
- Medial and final high hamza characters may have collisions (these likely do not occur).
- Lam + high hamza alef ligature does not form as it likely does not occur.
- In Word: kerning of Arabic proportional digits is incorrect. This is a bug in Word.
- In InDesign: some behaviors, such as the _lam-alef_ ligature, raised _kasra_ with _shadda_, and subtending marks, will not function correctly unless **Ligatures** is turned on in the **Characters** panel.

Both desktop and web fonts are provided in a single, all-platforms package on the [Download page](https://software.sil.org/lateef/download).

