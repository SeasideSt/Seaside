# Introduction #
Seaside 3.0.6 is a bug fix release for Seaside 3.0.


# Details #

The following bugs were fixed:
  * jQuery 1.6.2
  * jQuery UI 1.8.16
  * added some mssing jQuery 1.6 methods (thanks Nick)
  * changed JQAutocomplete use of #onComplete: to #onSuccess: as JQGetJson no longer supports #onComplete: (thanks Nick)
  * when unable to proceed from a debugger the HTML would only be rendered in Comanche
  * [Issue 572](https://code.google.com/p/seaside/issues/detail?id=572): 	add #removeDelegation convenience (thanks John)
  * [Issue 617](https://code.google.com/p/seaside/issues/detail?id=617):	update WAPerformanceFunctionalTest for Cog (thanks Gerd)
  * [Issue 631](https://code.google.com/p/seaside/issues/detail?id=631): 	update /status for Cog VM (thanks Michael)
  * [Issue 642](https://code.google.com/p/seaside/issues/detail?id=642): 	WATagBrush and WAPrettyPrintedDocument inconsistencies
  * [Issue 653](https://code.google.com/p/seaside/issues/detail?id=653): 	WARequestContext>>newDocument assumes #handler is not nil
  * [Issue 654](https://code.google.com/p/seaside/issues/detail?id=654): 	Add support for the disabled option to JQButton (thanks Jan)
  * [Issue 655](https://code.google.com/p/seaside/issues/detail?id=655): 	WAMimeType>>fromString: cannot handle a wildcard
  * [Issue 656](https://code.google.com/p/seaside/issues/detail?id=656): 	Browser broken on Welcome Page
  * [Issue 658](https://code.google.com/p/seaside/issues/detail?id=658): 	Seaside-Email should use request handler for configuration look up
  * [Issue 659](https://code.google.com/p/seaside/issues/detail?id=659): 	WAApplication>>handleFiltered: DNU when request isPrefetch (thanks Nick)
  * [Issue 660](https://code.google.com/p/seaside/issues/detail?id=660): 	support path parameters in WAUrl
  * [Issue 662](https://code.google.com/p/seaside/issues/detail?id=662): 	Refactor GRDelayedSend to use composition and reduce duplicate
  * [Issue 671](https://code.google.com/p/seaside/issues/detail?id=671):	Seaside-Tests-Core-Documents breaks dependencies
  * [Issue 672](https://code.google.com/p/seaside/issues/detail?id=672):	SequenceableCollection>>#endsWith: is not portable
  * [Issue 673](https://code.google.com/p/seaside/issues/detail?id=673):	WAHeaderFieldsTest>>#testCrLf uses non-portable method
  * [Issue 674](https://code.google.com/p/seaside/issues/detail?id=674): 	WASwazooAdaptor decodes an already decoded URI
  * [Issue 677](https://code.google.com/p/seaside/issues/detail?id=677): 	"self.opener is null" when opening sytle editor
  * [Issue 678](https://code.google.com/p/seaside/issues/detail?id=678): 	an iframe should be more like a pop up
  * [Issue 682](https://code.google.com/p/seaside/issues/detail?id=682): 	JQButton >> #icons and #icons: seem inconsistent
  * [Issue 683](https://code.google.com/p/seaside/issues/detail?id=683): 	self call: self infinite recursion detection (thanks Sean)
  * deprecate WATagBrush>>#onEnter:
  * deprecate WADivTag>>#clear
  * WARequestHandler class >> #push:while: has been deprecated for #push:during:

The following features were added:
  * The iframe tag now has a `#callback:` method that allows you to switch the session presenter. This has the advantage that the script generator and all the libraries are preserved. See `WAIframeFunctionalTest` for an example.