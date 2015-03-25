# Introduction #
Seaside 3.0.2 is a bug fix release for Seaside 3.0. There never was an official 3.0.1 release.


# Details #

The following bugs were fixed:
  * [Issue 606](https://code.google.com/p/seaside/issues/detail?id=606) WAKomEncoded fails serving CSS files from WAExternalFileLibrary
  * [Issue 41](https://code.google.com/p/seaside/issues/detail?id=41) Provide simple email abstraction
  * [Issue 602](https://code.google.com/p/seaside/issues/detail?id=602) Seaside's scriptaculous in place editor is bugged
  * [Issue 600](https://code.google.com/p/seaside/issues/detail?id=600) BlockClosure>>processHttp sends deprecated #fixTemps
  * [Issue 610](https://code.google.com/p/seaside/issues/detail?id=610) Welcome should display a warning if author initials are not set
  * [Issue 612](https://code.google.com/p/seaside/issues/detail?id=612) subscript out of bounds when encoding a single 0 character to UTF-8

In addition the following improvements were made:
  * added the possibility for new items to CTReport
  * GRCodecStream >> #isStream added
  * removed #hash, #= and #isDictionary from GRSmallDictionary
  * added a rule detecting the use of "self class hash", which does not work in GemStone
  * fixed findTokens: rule
  * updated to jQuery 1.4.4
  * updated to jQuery UI 1.8.6
  * do not include fragment in AJAX request URLs
  * fixes and improvements to the jQuery UI auto complete dialog
  * made script generator on WABuilder configurable
  * fix MNU in uploads due to missing content type in Chrome
  * WAPathConsumer >> #peekToEnd added
  * added WAUrl >> #withoutFragment
  * made the halo class configurable, like in morphic
  * added an experimental space tally to /status
  * The tool tips in the /config application update themselves depending on the state
  * fixed the WideString method JQDevelopmentLibrary>>jQueryJs