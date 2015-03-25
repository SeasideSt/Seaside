# Features #
  * In Pharo the web based class browser will use Nautilus if available (Pharo 2+).

# Breaking Changes #
  * the type of an input element is no longer in its class
    * you have to change the CSS selector of the input type eg `.checkbox` to `[type='checkbox']`
  * inline JavaScript in XHTML in XML mode will no longer work
  * we no longer ship JavaScript libraries for generating and parsing JSON
  * server adapter authors should send `#rfc6265String` instead of #`oldNetscapeString`, #`rfc2109String`, #`rfc2965String`, #`rfc6265String`
  * Cookie2 support is gone (only Opera ever supported it but doesn't anymore)
  * `WADivTag` has been removed, `WAGenericTag` is used instead, if you have class extensions there you need to move them to `WAGenericTag`
  * parsing an URL with a non-numeric port (eg. `http://www.seaside.st:8x/`) will now signal a `WAInvalidUrlSyntaxError`
  * the following deprecated methods have been removed
    * WARequestCookie class >> #fromString:
    * WAUrl >> #pathString
    * WAPopupAnchorTag >> #name
    * WAPopupAnchorTag >> #name:
  * The metacello configuration `ConfigurationOfSeaside3`'s default group now loads Core,Email,JSON,Javascript,JQuery and JQueryUI groups while it previously only loaded the Core group. This enhances discoverability for newcomers and existing users can still configure the load to only load the groups they need.

# Bugs Fixed #

The following bugs were fixed:
  * [Issue 706](https://code.google.com/p/seaside/issues/detail?id=706): 	Remove WADivTag
  * [Issue 763](https://code.google.com/p/seaside/issues/detail?id=763): 	Add support for srcset on img and source tag
  * [Issue 777](https://code.google.com/p/seaside/issues/detail?id=777): 	Make TestCase >> #fail SLime rule
  * [Issue 778](https://code.google.com/p/seaside/issues/detail?id=778): 	remove JSON libraries
  * [Issue 790](https://code.google.com/p/seaside/issues/detail?id=790): 	WAUrl parsing and serialization needs to be context dependent
  * [Issue 791](https://code.google.com/p/seaside/issues/detail?id=791): 	Replace Set-Cookie2 with RFC 6265
  * [Issue 796](https://code.google.com/p/seaside/issues/detail?id=796): 	Add support for Forwarded header
  * [Issue 807](https://code.google.com/p/seaside/issues/detail?id=807): 	MNU RBArgumentNode>>key with parameterized Seaside 3.1 REST Method
  * [Issue 809](https://code.google.com/p/seaside/issues/detail?id=809): 	Use HTML 5 meta tag for charset
  * [Issue 810](https://code.google.com/p/seaside/issues/detail?id=810): 	Provide a dedicated security package
  * [Issue 815](https://code.google.com/p/seaside/issues/detail?id=815): 	fix WABrowser in Pharo 4
  * [Issue 816](https://code.google.com/p/seaside/issues/detail?id=816): 	WAHtmlAttributes >> #addClass: allocates too much
  * [Issue 819](https://code.google.com/p/seaside/issues/detail?id=819):	JQAjax does not have a json: callback
  * [Issue 812](https://code.google.com/p/seaside/issues/detail?id=812): 	Input elements should not generate a class by default
  * [Issue 822](https://code.google.com/p/seaside/issues/detail?id=822): 	Drop clever CDATA trick
  * [Issue 824](https://code.google.com/p/seaside/issues/detail?id=824):   GRPackage>>#resolveWith: contains non-portable usage of String>>indexOfSubCollection:startingAt:
  * [Issue 825](https://code.google.com/p/seaside/issues/detail?id=825): 	Remove Methods deprecated in 3.1
  * [Issue 827](https://code.google.com/p/seaside/issues/detail?id=827): 	GRPlatform >> #deprecationExceptionSet should use ExceptionSet
  * [Issue 828](https://code.google.com/p/seaside/issues/detail?id=828): 	replace TimeStamp with DateAndTime
  * [Issue 830](https://code.google.com/p/seaside/issues/detail?id=830):    	[ENH](ENH.md) Javascript Condition with else decoration (JSConditionElse)
  * [Issue 833](https://code.google.com/p/seaside/issues/detail?id=833):	WARequest>>destroy doesn't set the body' to nil