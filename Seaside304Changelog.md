# Introduction #
Seaside 3.0.4 is a bug fix release for Seaside 3.0.


# Details #

The following bugs were fixed:
  * [Issue 9](https://code.google.com/p/seaside/issues/detail?id=9):    Add switch to WAFileLibrary such that #/ also generates static paths
  * [Issue 356](https://code.google.com/p/seaside/issues/detail?id=356): 	Add functional test for WAValidationDecoration
  * [Issue 462](https://code.google.com/p/seaside/issues/detail?id=462):	Have convenience methods for http status codes on WAResponse (thanks Avi Shefi)
  * [Issue 482](https://code.google.com/p/seaside/issues/detail?id=482): 	speedup WAEncoder
  * [Issue 522](https://code.google.com/p/seaside/issues/detail?id=522):	WAFileLibrary generated methods don't have timestamps
  * [Issue 542](https://code.google.com/p/seaside/issues/detail?id=542):	implement Strict Transport Security (thanks Avi Shefi)
  * [Issue 608](https://code.google.com/p/seaside/issues/detail?id=608):	Configuration Lookup is Slow (thanks Avi Shefi)
  * [Issue 620](https://code.google.com/p/seaside/issues/detail?id=620): 	WAFileLibrary>>name answers a Symbol, but used in places where String should be used
  * [Issue 624](https://code.google.com/p/seaside/issues/detail?id=624): 	Changing assigned configuration partens of an application does not correctly update the /config UI (thanks Avi Shefi)
  * [Issue 625](https://code.google.com/p/seaside/issues/detail?id=625): 	DNU RRComponent class >> #canBeRoot
  * [Issue 629](https://code.google.com/p/seaside/issues/detail?id=629): 	Seaside is broken on Swazoo 2.3
  * [Issue 630](https://code.google.com/p/seaside/issues/detail?id=630): 	Add WANoReapingStrategy
  * [Issue 634](https://code.google.com/p/seaside/issues/detail?id=634):	Add GC settings from Pharo
  * [Issue 632](https://code.google.com/p/seaside/issues/detail?id=632):	prevent response splitting
  * [Issue 637](https://code.google.com/p/seaside/issues/detail?id=637): 	Add option to make a file library send an X-Sendfile header instead of the the response body. (thanks Avi Shefi)
  * [Issue 639](https://code.google.com/p/seaside/issues/detail?id=639): 	merge WAHtmlCanvas and WARenderCanvas (thanks Avi Shefi)
  * [Issue 641](https://code.google.com/p/seaside/issues/detail?id=641):	Halo source view incorrectly displaying entity characters
  * [Issue 643](https://code.google.com/p/seaside/issues/detail?id=643):	load 3.0.4 on top of 3.0.3 results in tests hitting WAAttributeNotFound
  * [Issue 646](https://code.google.com/p/seaside/issues/detail?id=646):	GRPharoPlatform>>isIpAddress broken