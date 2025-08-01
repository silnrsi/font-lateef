---
title: Lateef - Font Features
fontversion: 4.400
---

Lateef is an OpenType-enabled font family that supports the Arabic script. It includes a number of optional features that provide alternative rendering that might be preferable for use in some contexts. The sections below enumerate the details of these features. Whether these features are available to users will depend on both the application and the rendering technology being used. Some applications let the user control certain features such as Character Variants to turn on the rendering of variant characters. However, at this point, most applications do not make use of those features so another solution is needed to show the variant characters. For applications that do not make use of the OpenType Character Variants, you can now download fonts customized with the variant glyphs you choose. Read this document, visit [TypeTuner Web](https://typetunerweb.languagetechnology.org/ttw/fonts2go.cgi), then choose the variants and download your font.

See [Using Font Features](https://software.sil.org/fonts/features/). Although that page is not targeted at Arabic script support, it does provide a comprehensive list of applications that make full use of the OpenType font technology.

See also [Arabic Fonts — Application Support](https://software.sil.org/arabicfonts/support/application-support/). It provides a fairly comprehensive list of applications that make full use of the OpenType font technology.

This page uses web fonts (WOFF) to demonstrate font features and should display correctly in all modern browsers. For a more concise example of how to use Lateef as a web font see *Lateef-webfont-example.html* in the font package web folder. 

*If this document is not displaying correctly a PDF version is also provided in the documentation/pdf folder of the release package.*

## Complete feature list

### Language system tags

<span class='affects'>Affects: U+062F, U+0630, U+0688..U+068F, U+0690, U+06EE, U+0759, U+075A, U+08AE, U+0645, U+0765, U+0766, U+08A7, U+06BE, U+0626, U+060C, U+061B, U+06F4, U+06F5, U+06F6, U+06F7, U+0650, U+064F, U+064C, U+0657</span>

Unfortunately, the UI needed to access the language-specific behavior is not yet present in many applications. LibreOffice and Microsoft Word 2016 support language-specific behavior for Kashmiri, Kurdish, Sindhi and Urdu. Microsoft Word 2019, but not LibreOffice, supports language-specific behavior for Kyrgyz. Neither application provides support for the Rohingya or Wolof languages. Some Harfbuzz-based apps, e.g., XeTeX, can access language-specific behavior. In the past, it was not always possible to override language-specific behavior in cases where the language-specific variants were undesirable but, starting with version 4.300, the font supports this possibility.

#### Kashmiri, Kurdish (Northern), Rohingya, Sindhi, Urdu

Language | Meem | Heh Doachashmee (06BE) | 4 | 6 | 7 | 0650/064E | 064C | 0652 | Feature Setting
:-- | ---: | ----: | -: | -: | -: | --: | --: | --: | :---
default | <span dir="rtl" class='lateef-R normal'>&#x0645;&#x0020;&#x0645;&#x0645;&#x0645;</span> | <span dir="rtl" class='lateef-R normal' >&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span> | <span dir="rtl" class='lateef-R normal'>&#x06F4;</span> |<span dir="rtl" class='lateef-R normal'>&#x06F6;</span> | <span dir="rtl" class='lateef-R normal'>&#x06F7;</span> | <span dir="rtl" class='lateef-R normal'>&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal'>&#x0628;&#x064C;</span> | <span dir="rtl" class='lateef-R normal'>&#x0628;&#x0652;</span> |
Kashmiri | <span dir="rtl" class='lateef-R normal' lang='ks'>&#x0645;&#x0020;&#x0645;&#x0645;&#x0645;</span> | <span dir="rtl" class='lateef-R normal' lang='ks'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span> | <span dir="rtl" class='lateef-R normal' lang='ks' style="color:red">&#x06F4;</span> | <span dir="rtl" class='lateef-R normal' lang='ks' style="color:red">&#x06F6;</span> | <span dir="rtl" class='lateef-R normal' lang='ks' style="color:red">&#x06F7;</span> | <span dir="rtl" class='lateef-R normal' lang='ks' style="color:red">&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='ks'>&#x0628;&#x064C;</span> | <span dir="rtl" class='lateef-R normal' lang='ks' style="color:red">&#x0628;&#x0652;</span> | `lang='ur'`
Kurdish</br>(Northern) | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x0645;&#x0020;&#x0645;&#x0645;&#x0645;</span> | <span dir="rtl" class='lateef-R normal' lang='ku' style="color:red">&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span> | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x06F4;</span> | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x06F6;</span> | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x06F7;</span> | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x0628;&#x064C;</span> | <span dir="rtl" class='lateef-R normal' lang='ku'>&#x0628;&#x0652;</span> |  `lang='ku'`
Rohingya | <span dir="rtl" class='lateef-R normal' lang='rhg'>&#x0645;&#x0020;&#x0645;&#x0645;&#x0645;</span> | <span dir="rtl" class='lateef-R normal' lang='rhg'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span> | <span dir="rtl" class='lateef-R normal' lang='rhg' style="color:red">&#x06F4;</span> | <span dir="rtl" class='lateef-R small' lang='rhg' style="color:red">&#x06F6;</span> | <span dir="rtl" class='lateef-R normal' lang='rhg' style="color:red">&#x06F7;</span> | <span dir="rtl" class='lateef-R normal' lang='rhg' style="color:red">&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='rhg' style="color:red">&#x0628;&#x064C;</span> | <span dir="rtl" class='lateef-R normal' lang='rhg'>&#x0628;&#x0652;</span> | `lang='rhg'`
Sindhi | <span dir="rtl" class='lateef-R normal' lang='sd' style="color:red">&#x0645;&#x0020;&#x0645;&#x0645;&#x0645;</span> | <span dir="rtl" class='lateef-R normal' lang='sd'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span> | <span dir="rtl" class='lateef-R normal' lang='sd'>&#x06F4;</span> | <span dir="rtl" class='lateef-R normal' lang='sd' style="color:red">&#x06F6;</span> | <span dir="rtl" class='lateef-R normal' lang='sd' style="color:red">&#x06F7;</span> | <span dir="rtl" class='lateef-R normal' lang='sd' style="color:red">&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='sd'>&#x0628;&#x064C;</span> | <span dir="rtl" class='lateef-R normal' lang='sd'>&#x0628;&#x0652;</span> | `lang='sd'`
Urdu | <span dir="rtl" class='lateef-R normal' lang='ur'>&#x0645;&#x0020;&#x0645;&#x0645;&#x0645;</span> | <span dir="rtl" class='lateef-R normal' lang='ur'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span> | <span dir="rtl" class='lateef-R normal' lang='ur' style="color:red">&#x06F4;</span> | <span dir="rtl" class='lateef-R normal' lang='ur' style="color:red">&#x06F6;</span> | <span dir="rtl" class='lateef-R normal' lang='ur' style="color:red">&#x06F7;</span> | <span dir="rtl" class='lateef-R normal' lang='ur' style="color:red">&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='ur'>&#x0628;&#x064C;</span> | <span dir="rtl" class='lateef-R normal' lang='ur'>&#x0628;&#x0652;</span> | `lang='ur'`

#### Kyrgyz, Malay, and Wolof

Language | Dal  | 0626 | 0674 | 0650/064E | 064F | 0657 | Feature Setting
:-- | -: |  ---: | --: | --: | --: | --: | :---
Default | <span dir="rtl" class='lateef-R normal'> &#x062F;</span> | <span dir="rtl" class='lateef-R normal'>&#x0626;&#x0020;&#x0626;&#x0626;&#x0626;</span> | <span dir="rtl" class='lateef-R normal'>&#x0627;&#x0674;</span> | <span dir="rtl" class='lateef-R normal'>&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal'>&#x0628;&#x064F;</span> | <span dir="rtl" class='lateef-R normal'>&#x0628;&#x0657;</span>|
Kyrgyz | <span dir="rtl" class='lateef-R normal' lang='ky'> &#x062F;</span> | <span dir="rtl" class='lateef-R normal' lang='ky' style="color:red">&#x0626;&#x0020;&#x0626;&#x0626;&#x0626;</span> | <span dir="rtl" class='lateef-R normal' lang='ky'>&#x0627;&#x0674;</span> | <span dir="rtl" class='lateef-R normal' lang='ky'>&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='ky'>&#x0628;&#x064F;</span> | <span dir="rtl" class='lateef-R normal' lang='ky'>&#x0628;&#x0657;</span>| `lang='ky'`
Malay | <span dir="rtl" class='lateef-R normal' lang='ms'> &#x062F;</span> | <span dir="rtl" class='lateef-R normal' lang='ms'>&#x0626;&#x0020;&#x0626;&#x0626;&#x0626;</span> | <span dir="rtl" class='lateef-R normal' lang='ms' style="color:red">&#x0627;&#x0674;</span> |<span dir="rtl" class='lateef-R normal' lang='ms' style="color:red">&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='ms'>&#x0628;&#x064F;</span> | <span dir="rtl" class='lateef-R normal' lang='ms'>&#x0628;&#x0657;</span>| `lang='ms'`
Wolof | <span dir="rtl" class='lateef-R normal' lang='wo' style="color:red"> &#x062F;</span> | <span dir="rtl" class='lateef-R normal' lang='wo'>&#x0626;&#x0020;&#x0626;&#x0626;&#x0626;</span> | <span dir="rtl" class='lateef-R normal' lang='wo'>&#x0627;&#x0674;</span> |<span dir="rtl" class='lateef-R normal' lang='wo' style="color:red">&#x0628;&#x0651;&#x0650;</span> | <span dir="rtl" class='lateef-R normal' lang='wo' style="color:red">&#x0628;&#x064F;</span> | <span dir="rtl" class='lateef-R normal' lang='wo' style="color:red">&#x0628;&#x0657;</span>| `lang='wo'`

### Character variants

There are some character shape differences in different languages which use the Arabic script. These can be accessed by using OpenType Character Variants, or through the language support mentioned above.

#### Meem 

<span class='affects'>Affects: U+0645, U+0765, U+0766, U+08A7</span>

Feature | Sample | Feature setting
:------------- | ---------------: | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'> م ممم ݥ ݥݥݥ ݦ ݦݦݦ ࢧ ࢧࢧࢧ </span> | `cv44=0`
Sindhi-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv44" 1'> م ممم ݥ ݥݥݥ ݦ ݦݦݦ ࢧ ࢧࢧࢧ </span>| `cv44=1`
Long-tail | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv44" 2'> م ممم ݥ ݥݥݥ ݦ ݦݦݦ ࢧ ࢧࢧࢧ </span>| `cv44=2`

#### Heh 

<span class='affects'>Affects: U+0647 (This feature is not recommended for use. The features available for Heh Doachashmee are preferred.)</span>

Feature | Sample | Feature setting
:------------- | ---------------: | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'> ه ههه </span>| `cv48=0`
Kurdish-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv48" 3'> ه ههه </span>| `cv48=3`
Sindhi-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv48" 1'> ه ههه </span>| `cv48=1`
Urdu-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv48" 2'> ه ههه </span>| `cv48=2`

#### Heh Doachashmee 

<span class='affects'>Affects: U+06BE</span>

Feature | Sample | Feature setting
:------------- | ------: | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span>| `cv49=0`
Knotted | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv49" 1'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span>| `cv49=1`
Bowtie | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv49" 2'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span>| `cv49=2`
Kurdish-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv49" 3'>&#x06be;&#x0020;&#x06be;&#x06be;&#x06be;</span>| `cv49=3`

#### Kyrgyz OE 

<span class='affects'>Affects: U+06C5</span>

Feature | Sample | Feature setting
:------------- | ---------------: | :------------- 
Loop | <span dir="rtl" class='lateef-R normal'>ۅ</span> | `cv51=0`
Bar | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv51" 1'>ۅ</span>| `cv51=1`

#### Yeh Hamza 

<span class='affects'>Affects: U+0626</span>

Feature | Sample | Feature setting
:------------- | ---------------: | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'>ئ ‍ئ</span> | `cv54=0`
Right hamza| <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv54" 1'>ئ ‍ئ</span>| `cv54=1`
Mid hamza| <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv54" 2'>ئ ‍ئ</span>| `cv54=2`

#### Shadda+kasra placement 

<span class='affects'>Affects: U+064D, U+0650 with U+0651</span>

Feature | Sample | Feature setting
:------------- | :--------------- | :------------- 
Default | <span dir="rtl" class='lateef-R normal'> بِّ ◌ِّ بٍّ ◌ٍّ </span> | `cv62=0`
Lowered | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv62" 1'> بِّ ◌ِّ بٍّ ◌ٍّ </span>| `cv62=1`
Raised | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv62" 2'> بِّ ◌ِّ بٍّ ◌ٍّ </span>| `cv62=2`

#### Damma 

<span class='affects'>Affects: U+064F</span>

Feature | Sample | Feature setting
:------------- | :--------------- | :------------- 
Default | <span dir="rtl" class='lateef-R normal'> بُ ◌ُ</span> | `cv70=0`
Filled | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv70" 1'>بُ ◌ُ</span>| `cv70=1`
Short | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv70" 2'>بُ ◌ُ</span>| `cv70=2`
Crossed | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv70" 3'>بُ ◌ُ</span>| `cv70=3`

#### Dammatan 

<span class='affects'>Affects: U+064C</span>

Feature | Sample | Feature setting
:------------- | :--------------- | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'>بٌ ◌ٌ</span> | `cv72=0`
Six-nine | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv72" 1'>بٌ ◌ٌ</span>| `cv72=1`
Two-nine | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv72" 2'>بٌ ◌ٌ</span>| `cv72=2`

#### Inverted Damma 

<span class='affects'>Affects: U+0657</span>

Feature | Sample | Feature setting
:------------- | :------ | :------------- 
Default | <span dir="rtl" class='lateef-R normal'>بٗ ◌ٗ</span> | `cv74=0`
Hollow | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv74" 1'>بٗ ◌ٗ</span>| `cv74=1`
Filled | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv74" 2'>بٗ ◌ٗ</span>| `cv74=2`

#### Superscript Alef 

<span class='affects'>Affects: U+0670 on all yeh, sad and seen-like characters 
U+0620, U+0626, U+0633, U+0634, U+0635, U+0636, U+063D, U+063E, U+063F, U+0649, U+064A, U+0678, U+069A, U+069B, U+069C, U+069D, U+069E, U+06CC, U+06CD, U+06CE, U+06D0, U+06D1, U+06FA, U+06FB, U+075C, U+076D, U+0770, U+077D, U+077E, U+0775, U+0776, U+0777, U+08A8, U+08A9, U+08AF, U+08BA</span>

Feature | Sample | Feature setting
:------------- | ---------------: | :------------- 
Default | <span dir="rtl" class='lateef-R normal'>&#x0620;&#x0670; &#x0620;&#x0670;&#x0620;&#x0670; &#x0626;&#x0670; &#x0626;&#x0670;&#x0626;&#x0670; &#x0633;&#x0670; &#x0633;&#x0670;&#x0633;&#x0670; &#x0634;&#x0670; &#x0634;&#x0670;&#x0634;&#x0670; &#x0635;&#x0670; &#x0635;&#x0670;&#x0635;&#x0670; &#x0636;&#x0670; &#x0636;&#x0670;&#x0636;&#x0670; &#x063D;&#x0670; &#x063D;&#x0670;&#x063D;&#x0670; &#x063E;&#x0670; &#x063E;&#x0670;&#x063E;&#x0670; &#x063F;&#x0670; &#x063F;&#x0670;&#x063F;&#x0670; &#x0649;&#x0670; &#x0649;&#x0670;&#x0649;&#x0670; &#x064A;&#x0670; &#x064A;&#x0670;&#x064A;&#x0670; &#x0678;&#x0670; &#x0678;&#x0670;&#x0678;&#x0670; &#x069A;&#x0670; &#x069A;&#x0670;&#x069A;&#x0670; &#x069B;&#x0670; &#x069B;&#x0670;&#x069B;&#x0670; &#x069C;&#x0670; &#x069C;&#x0670;&#x069C;&#x0670; &#x069D;&#x0670; &#x069D;&#x0670;&#x069D;&#x0670; &#x069E;&#x0670; &#x069E;&#x0670;&#x069E;&#x0670; &#x06CC;&#x0670; &#x06CC;&#x0670;&#x06CC;&#x0670; &#x06CD;&#x0670; &#x0628;&#x06CD;&#x0670; &#x06CE;&#x0670; &#x06CE;&#x0670;&#x06CE;&#x0670; &#x06D0;&#x0670; &#x06D0;&#x0670;&#x06D0;&#x0670; &#x06D1;&#x0670; &#x06D1;&#x0670;&#x06D1;&#x0670; &#x06FA;&#x0670; &#x06FA;&#x0670;&#x06FA;&#x0670; &#x06FB;&#x0670; &#x06FB;&#x0670;&#x06FB;&#x0670; &#x075C;&#x0670; &#x075C;&#x0670;&#x075C;&#x0670; &#x076D;&#x0670; &#x076D;&#x0670;&#x076D;&#x0670; &#x0770;&#x0670; &#x0770;&#x0670;&#x0770;&#x0670; &#x077D;&#x0670; &#x077D;&#x0670;&#x077D;&#x0670; &#x077E;&#x0670; &#x077E;&#x0670;&#x077E;&#x0670; &#x0775;&#x0670; &#x0775;&#x0670;&#x0775;&#x0670; &#x0776;&#x0670; &#x0776;&#x0670;&#x0776;&#x0670; &#x0777;&#x0670; &#x0777;&#x0670;&#x0777;&#x0670; &#x08A8;&#x0670; &#x08A8;&#x0670;&#x08A8;&#x0670; &#x08A9;&#x0670; &#x08A9;&#x0670;&#x08A9;&#x0670; &#x08AF;&#x0670; &#x08AF;&#x0670;&#x08AF;&#x0670; &#x08BA;&#x0670; &#x08BA;&#x0670;&#x08BA;&#x0670;</span> | `cv76=0`
Large | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv76" 1'>&#x0620;&#x0670; &#x0620;&#x0670;&#x0620;&#x0670; &#x0626;&#x0670; &#x0626;&#x0670;&#x0626;&#x0670; &#x0633;&#x0670; &#x0633;&#x0670;&#x0633;&#x0670; &#x0634;&#x0670; &#x0634;&#x0670;&#x0634;&#x0670; &#x0635;&#x0670; &#x0635;&#x0670;&#x0635;&#x0670; &#x0636;&#x0670; &#x0636;&#x0670;&#x0636;&#x0670; &#x063D;&#x0670; &#x063D;&#x0670;&#x063D;&#x0670; &#x063E;&#x0670; &#x063E;&#x0670;&#x063E;&#x0670; &#x063F;&#x0670; &#x063F;&#x0670;&#x063F;&#x0670; &#x0649;&#x0670; &#x0649;&#x0670;&#x0649;&#x0670; &#x064A;&#x0670; &#x064A;&#x0670;&#x064A;&#x0670; &#x0678;&#x0670; &#x0678;&#x0670;&#x0678;&#x0670; &#x069A;&#x0670; &#x069A;&#x0670;&#x069A;&#x0670; &#x069B;&#x0670; &#x069B;&#x0670;&#x069B;&#x0670; &#x069C;&#x0670; &#x069C;&#x0670;&#x069C;&#x0670; &#x069D;&#x0670; &#x069D;&#x0670;&#x069D;&#x0670; &#x069E;&#x0670; &#x069E;&#x0670;&#x069E;&#x0670; &#x06CC;&#x0670; &#x06CC;&#x0670;&#x06CC;&#x0670; &#x06CD;&#x0670; &#x0628;&#x06CD;&#x0670; &#x06CE;&#x0670; &#x06CE;&#x0670;&#x06CE;&#x0670; &#x06D0;&#x0670; &#x06D0;&#x0670;&#x06D0;&#x0670; &#x06D1;&#x0670; &#x06D1;&#x0670;&#x06D1;&#x0670; &#x06FA;&#x0670; &#x06FA;&#x0670;&#x06FA;&#x0670; &#x06FB;&#x0670; &#x06FB;&#x0670;&#x06FB;&#x0670; &#x075C;&#x0670; &#x075C;&#x0670;&#x075C;&#x0670; &#x076D;&#x0670; &#x076D;&#x0670;&#x076D;&#x0670; &#x0770;&#x0670; &#x0770;&#x0670;&#x0770;&#x0670; &#x077D;&#x0670; &#x077D;&#x0670;&#x077D;&#x0670; &#x077E;&#x0670; &#x077E;&#x0670;&#x077E;&#x0670; &#x0775;&#x0670; &#x0775;&#x0670;&#x0775;&#x0670; &#x0776;&#x0670; &#x0776;&#x0670;&#x0776;&#x0670; &#x0777;&#x0670; &#x0777;&#x0670;&#x0777;&#x0670; &#x08A8;&#x0670; &#x08A8;&#x0670;&#x08A8;&#x0670; &#x08A9;&#x0670; &#x08A9;&#x0670;&#x08A9;&#x0670; &#x08AF;&#x0670; &#x08AF;&#x0670;&#x08AF;&#x0670; &#x08BA;&#x0670; &#x08BA;&#x0670;&#x08BA;&#x0670;</span>| `cv76=1`
Small | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv76" 2'>&#x0620;&#x0670; &#x0620;&#x0670;&#x0620;&#x0670; &#x0626;&#x0670; &#x0626;&#x0670;&#x0626;&#x0670; &#x0633;&#x0670; &#x0633;&#x0670;&#x0633;&#x0670; &#x0634;&#x0670; &#x0634;&#x0670;&#x0634;&#x0670; &#x0635;&#x0670; &#x0635;&#x0670;&#x0635;&#x0670; &#x0636;&#x0670; &#x0636;&#x0670;&#x0636;&#x0670; &#x063D;&#x0670; &#x063D;&#x0670;&#x063D;&#x0670; &#x063E;&#x0670; &#x063E;&#x0670;&#x063E;&#x0670; &#x063F;&#x0670; &#x063F;&#x0670;&#x063F;&#x0670; &#x0649;&#x0670; &#x0649;&#x0670;&#x0649;&#x0670; &#x064A;&#x0670; &#x064A;&#x0670;&#x064A;&#x0670; &#x0678;&#x0670; &#x0678;&#x0670;&#x0678;&#x0670; &#x069A;&#x0670; &#x069A;&#x0670;&#x069A;&#x0670; &#x069B;&#x0670; &#x069B;&#x0670;&#x069B;&#x0670; &#x069C;&#x0670; &#x069C;&#x0670;&#x069C;&#x0670; &#x069D;&#x0670; &#x069D;&#x0670;&#x069D;&#x0670; &#x069E;&#x0670; &#x069E;&#x0670;&#x069E;&#x0670; &#x06CC;&#x0670; &#x06CC;&#x0670;&#x06CC;&#x0670; &#x06CD;&#x0670; &#x0628;&#x06CD;&#x0670; &#x06CE;&#x0670; &#x06CE;&#x0670;&#x06CE;&#x0670; &#x06D0;&#x0670; &#x06D0;&#x0670;&#x06D0;&#x0670; &#x06D1;&#x0670; &#x06D1;&#x0670;&#x06D1;&#x0670; &#x06FA;&#x0670; &#x06FA;&#x0670;&#x06FA;&#x0670; &#x06FB;&#x0670; &#x06FB;&#x0670;&#x06FB;&#x0670; &#x075C;&#x0670; &#x075C;&#x0670;&#x075C;&#x0670; &#x076D;&#x0670; &#x076D;&#x0670;&#x076D;&#x0670; &#x0770;&#x0670; &#x0770;&#x0670;&#x0770;&#x0670; &#x077D;&#x0670; &#x077D;&#x0670;&#x077D;&#x0670; &#x077E;&#x0670; &#x077E;&#x0670;&#x077E;&#x0670; &#x0775;&#x0670; &#x0775;&#x0670;&#x0775;&#x0670; &#x0776;&#x0670; &#x0776;&#x0670;&#x0776;&#x0670; &#x0777;&#x0670; &#x0777;&#x0670;&#x0777;&#x0670; &#x08A8;&#x0670; &#x08A8;&#x0670;&#x08A8;&#x0670; &#x08A9;&#x0670; &#x08A9;&#x0670;&#x08A9;&#x0670; &#x08AF;&#x0670; &#x08AF;&#x0670;&#x08AF;&#x0670; &#x08BA;&#x0670; &#x08BA;&#x0670;&#x08BA;&#x0670;</span>| `cv76=2`

#### Sukun 

<span class='affects'>Affects: U+0652</span>

Feature | Sample | Feature setting
:------------- | :--------------- | :------------- 
Closed | <span dir="rtl" class='lateef-R normal'>بْ ◌ْ</span> | `cv78=0`
Open down | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv78" 1'>بْ ◌ْ</span>| `cv78=1`
Open left | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv78" 2'>بْ ◌ْ</span>| `cv78=2`
Closed | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv78" 3'>بْ ◌ْ</span>| `cv78=3`

#### End of ayah 

<span class='affects'>Affects: U+06DD</span>

These alternates are also available using the Stylistic Alternates (salt) feature, but at this time we know of no OpenType-based applications that can access these. 

Firefox allows you to use U+06DD followed by the digits and proper rendering occurs. Some applications require the following:

* precede the entire sequence (subtending mark plus following digits) with
        202D LEFT-TO-RIGHT OVERRIDE
* follow the entire sequence with U+202C POP DIRECTIONAL FORMATTING.

Surrounding the sequence with U+202D and U+202C seems to give the most reliable results in different browsers. However, we have not found a solution that works in Internet Explorer/Edge.

In the example below, the following codepoints are used: U+202D U+06DD U+0031 U+0032 U+0033 U+202C U+202D U+06DD U+0611 U+0622 U+0663 U+202C.

Feature | Sample | Feature setting
:------------- | :--------------- | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'>&#x202D;&#x6DD;&#x31;&#x32;&#x33;&#x202C; &#x202D;&#x6DD;&#x0661;&#x0662;&#x0663;&#x202C;</span> | `cv80=0`
Simplified A | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv80" 1'>&#x202D;&#x6DD;&#x31;&#x32;&#x33;&#x202C; &#x202D;&#x6DD;&#x0661;&#x0662;&#x0663;&#x202C;</span>| `cv80=1`
Simplified B | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv80" 2'>&#x202D;&#x6DD;&#x31;&#x32;&#x33;&#x202C; &#x202D;&#x6DD;&#x0661;&#x0662;&#x0663;&#x202C;</span>| `cv80=2`

The DISPUTED END OF AYAH (U+08E2) is also now available in the font. It works in the same way as End of ayah. 

<span dir="rtl" class='lateef-R normal'>&#x202D;&#x8E2;&#x663;&#x664;&#x665;&#x202C;</span>

#### Eastern digits 

<span class='affects'>Affects: U+06F4, U+06F6, U+06F7</span>

Feature | Sample | Feature setting
:------------- | :--------------- | :------------- 
Standard | <span dir="rtl" class='lateef-R normal'>&#x06F4;&#x06F6;&#x06F7;</span> | `cv82=0`
Sindhi-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv82" 1'>&#x06F4;&#x06F6;&#x06F7;</span>| `cv82=1`
Urdu-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv82" 2'>&#x06F4;&#x06F6;&#x06F7;</span>| `cv82=2`
Kurdish-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv82" 3'>&#x06F4;&#x06F6;&#x06F7;</span>| `cv82=3`
Rohingya-style | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv82" 4'>&#x06F4;&#x06F6;&#x06F7;</span>| `cv82=4`
Default | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv82" 5'>&#x06F4;&#x06F6;&#x06F7;</span>| `cv82=5`

#### Comma 

<span class='affects'>Affects: U+060C, U+061B (This feature is not recommended for use. The Unicode Standard recommends the use of <span dir="rtl" class='lateef-R normal'>&#x2e41;</span> U+2E41 and <span dir="rtl" class='lateef-R normal'>&#x204f;</span> U+204F instead.)</span>

Feature | Sample |  Feature setting
:------------- | :--------------- | :------------- 
Upward | <span dir="rtl" class='lateef-R normal'>، ؛</span> | `cv84=0`
Downward | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv84" 1'>، ؛</span>| `cv84=1`

#### Decimal separator 

<span class='affects'>Affects: U+066B</span>

Feature | Sample |  Feature setting
:------------- | :--------------- | :------------- 
Small reh | <span dir="rtl" class='lateef-R normal'>&#x066B;</span> | `cv85=0`
Slash | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv85" 1'>&#x066B;</span>| `cv85=1`

#### Guillemet 

<span class='affects'>Affects: U+00AB U+00BB U+2039 U+203A</span>

Feature | Sample |  Feature setting
:------------- | ------: | :------------- 
Rounded | <span dir="rtl" class='lateef-R normal'>&#x00AB;&#x2039;&#x0628;&#x203A;&#x00BB;</span> | `cv88=0`
Angled | <span dir="rtl" class='lateef-R normal' style='font-feature-settings: "cv88" 1'>&#x00AB;&#x2039;&#x0628;&#x203A;&#x00BB;</span>| `cv88=1`

### Other user font features

#### Proportional figures

Tabular digits are the default for Latin digits. Lateef supports the OpenType **Proportional Figures (pnum)** for Latin digits.

<span class='affects'>Affects: U+0030..U+0039</span>

Feature | Sample | Feature setting
:------------- | :------ | :------------- 
False      | <span dir="ltr" class='lateefL-R normal'>0123456789</span>| `pnum=0`
True     | <span dir="ltr" class='lateefL-R normal' style='font-feature-settings: "pnum" 1'>0123456789</span>| `pnum=1`

#### Tabular figures

Proportional digits are the default for Arabic digits. Lateef supports the OpenType **Tabular Figures (tnum)** for Arabic digits.

<span class='affects'>Affects: U+0660..U+0669, U+06F0.. U+06F9</span>

Feature | Sample | Feature setting
:------------- | :------ | :------------- 
False      | <span class='lateefL-R normal'>&#x0660;&#x0661;&#x0662;&#x0663;&#x0664;&#x0665;&#x0666;&#x0667;&#x0668;&#x0669; &#x06F0;&#x06F1;&#x06F2;&#x06F3;&#x06F5;&#x06F6;&#x06F7;&#x06F8;&#x06F9;</span>| `tnum=0`
True     | <span class='lateefL-R normal' style='font-feature-settings: "tnum" 1'>&#x0660;&#x0661;&#x0662;&#x0663;&#x0664;&#x0665;&#x0666;&#x0667;&#x0668;&#x0669; &#x06F0;&#x06F1;&#x06F2;&#x06F3;&#x06F5;&#x06F6;&#x06F7;&#x06F8;&#x06F9;</span>| `tnum=1`

#### Disable digit kerning (see FAQ)

_This feature is only available in TypeTuner Web._

<span class='affects'>The Arabic digits are proportional by default and Lateef includes kerning to improve the spacing of certain pairs of digits such as &#x0667;&#x0668;. However there are some applications, including Microsoft Word for Windows, that process the digit kerning information incorrectly, actually making some digits too far apart and some too close together. We have added a special Typetuner feature that can be used to create a version of the Lateef fonts in which the digit kerning is _disabled_. When using those fonts in Microsoft Word the resulting digit spacing will be much nicer than Tabular, but not quite as good as it would be if the application's kerning worked correctly. This is discussed further in the [FAQ](faq.md).</span>

<!-- PRODUCT SITE ONLY
[font id='lateef' face='Lateef-Regular' bold='Lateef-Bold' size='160%' rtl=1]
[font id='lateefL' face='Lateef-Regular' bold='Lateef-Bold' size='160%' ltr=1]

-->


