---
title: Lateef - Announcement
fontversion: 4.300
---

### Changes

#### New

- Added:
  - 0897 ARABIC PEPET
  - FD40 ARABIC LIGATURE RAHIMAHU ALLAAH
  - FD41 ARABIC LIGATURE RADI ALLAAHU ANH
  - FD43 ARABIC LIGATURE RADI ALLAAHU ANHUM
  - FD44 ARABIC LIGATURE RADI ALLAAHU ANHUMAA
  - FD45 ARABIC LIGATURE RADI ALLAAHU ANHUNNA
  - FD46 ARABIC LIGATURE SALLALLAAHU ALAYHI WA-AALIH
  - FD48 ARABIC LIGATURE ALAYHIM AS-SALAAM
  - FD49 ARABIC LIGATURE ALAYHIMAA AS-SALAAM
  - FD4A ARABIC LIGATURE ALAYHI AS-SALAATU WAS-SALAAM
  - FD4B ARABIC LIGATURE QUDDISA SIRRAH
  - FD4C ARABIC LIGATURE SALLALLAHU ALAYHI WAAALIHEE WA-SALLAM
  - FD4D ARABIC LIGATURE ALAYHAA AS-SALAAM
  - FD4E ARABIC LIGATURE TABAARAKA WA-TAAALAA
  - FD4F ARABIC LIGATURE RAHIMAHUM ALLAAH
  - FDFE ARABIC LIGATURE SUBHAANAHU WA TAAALAA
  - FDFF ARABIC LIGATURE AZZA WA JALL
  - 10EC2 ARABIC LETTER DAL WITH TWO DOTS VERTICALLY BELOW
  - 10EC3 ARABIC LETTER TAH WITH TWO DOTS VERTICALLY BELOW
  - 10EC4 ARABIC LETTER KAF WITH TWO DOTS VERTICALLY BELOW
  - 10EFC ARABIC COMBINING ALEF OVERLAY
  - Added support for Kashmiri language
  - Added facility to override default language behavior through feature selection
  - Added support for cv76 (dagger alef) on spacing characters and tatweel

#### Improved

- Enlarged Arabic-style guillemet quotes
- Enhanced positioning of U+06E2 ARABIC SMALL HIGH MEEM ISOLATED FORM next to adjacent vowel marks
- Improved positioning of final YEH BARREE characters when preceeded by a character with two or three nukat below
- Improved alef+mark positioning to reduce collisions
- Improved madda reordering to comply with UAX #53
- Documentation enhancements

#### Known issues

- Shaping for the newly added characters may not yet occur in applications.
- Medial and final high hamza characters may have collisions (these likely do not occur).
- Lam + high hamza alef ligature does not form as it likely does not occur.
- In Word: kerning of Arabic proportional digits is incorrect. This is a bug in Word.
- In InDesign: some behaviors, such as the _lam-alef_ ligature, raised _kasra_ with _shadda_, and subtending marks, will not function correctly unless **Ligatures** is turned on in the **Characters** panel.

