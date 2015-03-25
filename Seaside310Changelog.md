# Introduction #
Seaside 3.1 contains the following changes.
  * The way session are tracked has been made customizable. The following strategies are supported out of the box:
    * query fields
    * cookies of the browser supports it, query fields otherwise
    * _new_: cookies only
    * _new_: cookies for browsers and IPs for web crawlers, inspired by [Crawler Session Manager Valve](http://www.tomcatexpert.com/blog/2011/05/18/crawler-session-manager-valve) for Tomcat
    * _new_: ssl session id, needs special server support, right now only works with AJP
  * All the deprecated methods and classes have been removed.
  * Session continuations have been made subclasses of WARequestHandler. Those who have created their own continuation subclasses may need to make adjustments to their classes.
  * New WAPluggableActionContinuation introduced (see [Issue 680](https://code.google.com/p/seaside/issues/detail?id=680) for details). Those subclassing WAActionPhaseContinuation probably want to be subclasses WACallbackProcessingActionContinuation now instead.
  * Removed WAMain and its subclasses. Applications now specify an initial continuation instead. Those subclassing WAMain should consider implementing a subclass of WASessionContinuation instead.
  * `WAPopupAnchorTag>>#name:` has been replaced by `WAPopupAnchorTag>>#windowTitle:`
  * JSON support is now in Seaside-JSON-Core, #jsonOn: methods get a JSON canvas instead of a stream as an argument
  * Support for the HTML 5 "multiple" attribute has been added. Text input and file upload tags now understand the `#multipleValuesCallback:` message. The value passed to the callback will be a sequenceable collection.
  * Document handlers (created by one of the `#document:` methods) are now stored in their respective session instead as a session in the application. This means that the number of "sessions" used when using document handlers goes down and there's less pressure on the session cache. Also the document handlers now time out when their session times out. However the size of the individual session now goes up when using document handlers. The document handlers of a session can no longer be accessed concurrently because they are behind the session lock. In addition it makes the code in `WAApplication` simpler because it only cares about sessions.
  * The `#resetIfPossible` method has been added to `WAResponse`. It clears a partially rendered response if that's possible (not streaming server is used).
  * The optional `#flush` method has been added to `WAResponse`. This allows programmatic flushing of a partially rendered response. Out of the box this is used by comet and a new render phase continuation that flushes once the HTML header has been rendered. Currently only the Comanche adaptor supports this.
  * `WARestfulComponentFilter` allows applications to easily switch from session-less parts to session-based parts.
  * add `#dontDestroy` to `WARequestContext` to prevent object destruction during debugging

# Bugs Fixed #
  * [Issue 111](https://code.google.com/p/seaside/issues/detail?id=111): 	jumpTo instance variable on WASession
  * [Issue 244](https://code.google.com/p/seaside/issues/detail?id=244) : 	WABatchedList>>hasMultiplePages
  * [Issue 325](https://code.google.com/p/seaside/issues/detail?id=325):	Force the use of cookies
  * [Issue 364](https://code.google.com/p/seaside/issues/detail?id=364): 	add always redirect option to WARegistry
  * [Issue 453](https://code.google.com/p/seaside/issues/detail?id=453): 	document path consumer
  * [Issue 500](https://code.google.com/p/seaside/issues/detail?id=500): 	WADebugErrorHandler>>unableToResumeResponse provides invalid instructions
  * [Issue 591](https://code.google.com/p/seaside/issues/detail?id=591):	WAComboResponse - a combined buffered / streaming response
  * [Issue 592](https://code.google.com/p/seaside/issues/detail?id=592):	investigate tracking sessions by SSL session id
  * [Issue 626](https://code.google.com/p/seaside/issues/detail?id=626): 	Allow platforms to implement custom encoders for speed
  * [Issue 636](https://code.google.com/p/seaside/issues/detail?id=636): 	expected exception behavior WAWalkbackErrorHandler not portable (and not ANSI compliant)
  * [Issue 645](https://code.google.com/p/seaside/issues/detail?id=645): 	WAPopupAnchorTag overrides #name: of WAAnchorTag with different semantics
  * [Issue 663](https://code.google.com/p/seaside/issues/detail?id=663): 	Remove default nil option from WAListAttribute
  * [Issue 676](https://code.google.com/p/seaside/issues/detail?id=676): 	response generators have to reset the response before generating a new one
  * [Issue 679](https://code.google.com/p/seaside/issues/detail?id=679):   Make SessionContinuations into subclasses of RequestHandler
  * [Issue 680](https://code.google.com/p/seaside/issues/detail?id=680):   Add a pluggable action phase continuation
  * [Issue 681](https://code.google.com/p/seaside/issues/detail?id=681):   Get rid of WAMain and subclasses
  * [Issue 697](https://code.google.com/p/seaside/issues/detail?id=697):	Within a WAComponent I've repeated implemented #children to return a collection that contains a reference to self. Causing infinite recursion
  * [Issue 699](https://code.google.com/p/seaside/issues/detail?id=699): 	GRPharoPlatform>>#write:toFile:inFolder: uses CrLfFileStream in seaside 3.0.6.3
  * [Issue 707](https://code.google.com/p/seaside/issues/detail?id=707):	don't use #document:mimeType: when mime type is nil
  * [Issue 708](https://code.google.com/p/seaside/issues/detail?id=708):	JQDialog>>#buttons:
  * [Issue 709](https://code.google.com/p/seaside/issues/detail?id=709):	move document handlers to session
  * [Issue 712](https://code.google.com/p/seaside/issues/detail?id=712):	Pretty printing is broken for JavaScript expressions
  * [Issue 716](https://code.google.com/p/seaside/issues/detail?id=716):	WARequestHandler>>#preferenceAt: has no corresponding WARequestHandler>>#preferenceAt: ifAbsent:
  * [Issue 717](https://code.google.com/p/seaside/issues/detail?id=717): 	WAMemoryItem>>sizeOfObject
  * [Issue 718](https://code.google.com/p/seaside/issues/detail?id=718): 	Make profile tree more useful
  * [Issue 722](https://code.google.com/p/seaside/issues/detail?id=722): 	add support for the "multiple" attribute
  * [Issue 724](https://code.google.com/p/seaside/issues/detail?id=724):	add .pushState to ajaxifier
  * [Issue 726](https://code.google.com/p/seaside/issues/detail?id=726): 	Rework JSON and JavaScript escaping
  * [Issue 727](https://code.google.com/p/seaside/issues/detail?id=727): 	walkback only works for exceptions in callback phase
  * [Issue 728](https://code.google.com/p/seaside/issues/detail?id=728): 	add support for new HTTP status codes
  * [Issue 730](https://code.google.com/p/seaside/issues/detail?id=730): 	Float infinity and nan don't produce correct JSON representations
  * [Issue 731](https://code.google.com/p/seaside/issues/detail?id=731): 	utf-16 broken
  * [Issue 732](https://code.google.com/p/seaside/issues/detail?id=732): 	Add flushing render phase continuation
  * [Issue 733](https://code.google.com/p/seaside/issues/detail?id=733): 	multibyte characters broken when flushing a WAComboResponse
  * [Issue 735](https://code.google.com/p/seaside/issues/detail?id=735):	Problem with WAFileMetadataLibrary>>#deployFiles
  * [Issue 736](https://code.google.com/p/seaside/issues/detail?id=736): 	implement #basicNextPutAll: on pseudo streams
  * [Issue 737](https://code.google.com/p/seaside/issues/detail?id=737): 	Update WAScreenshot to work with Pharo 2.0
  * [Issue 738](https://code.google.com/p/seaside/issues/detail?id=738): 	Set encoding for Seaside-REST responses
  * [Issue 740](https://code.google.com/p/seaside/issues/detail?id=740):	Improper use of #replaceAll:with: (@ WAFileMetadataLibrary)
  * [Issue 741](https://code.google.com/p/seaside/issues/detail?id=741): 	#includesSubString: deprecated in Pharo 2.0
  * [Issue 742](https://code.google.com/p/seaside/issues/detail?id=742): 	Generated javascripts are not directly serialized on the canvas stream (leading to slow performance?)
  * [Issue 743](https://code.google.com/p/seaside/issues/detail?id=743): 	WAVNCController still uses Project which is gone from Pharo-1.4
  * [Issue 747](https://code.google.com/p/seaside/issues/detail?id=747): 	Fix HTML 5 support
  * [Issue 749](https://code.google.com/p/seaside/issues/detail?id=749): 	Wrong handling of urls encoded in UTF8
  * [Issue 751](https://code.google.com/p/seaside/issues/detail?id=751):	WAAccept>>fromString: assumes the only parameter to a media-range is 'q'
  * [Issue 754](https://code.google.com/p/seaside/issues/detail?id=754):	#asJson produces strings with non-valid escape sequences "\0", "\a" and "\x.."
  * [Issue 755](https://code.google.com/p/seaside/issues/detail?id=755):	JSJsonParser removes whitespace at the start of string literals
  * [Issue 756](https://code.google.com/p/seaside/issues/detail?id=756): 	WACanvasBrushTest>>testCanvasWithLineBreaksGemStoneIssue289 uses non-portable selectors
  * [Issue 759](https://code.google.com/p/seaside/issues/detail?id=759): 	application/json recognized as a binary mime type
  * [Issue 760](https://code.google.com/p/seaside/issues/detail?id=760): 	addAllFilesIn: is broken in Pharo 20
  * [Issue 762](https://code.google.com/p/seaside/issues/detail?id=762): 	WAUrl decodePercent: 'abc%' fails
  * [Issue 769](https://code.google.com/p/seaside/issues/detail?id=769): 	more Slime rule for collections
  * [Issue 770](https://code.google.com/p/seaside/issues/detail?id=770): 	ScaledDecimal rendering support
  * [Issue 772](https://code.google.com/p/seaside/issues/detail?id=772): 	WAResponse >>#doNotCache doesn't send full Cache-Control header

# Changes #
## Users ##
  * replaced `WARenderCanvas` with `WAHtmlCanvas` (already available in 3.0)
  * `WASelectionDateTable` no longer adds border
  * `WASelectionDateTable` no longer adds CSS style
  * `#jsonOn:` now has a JsonCanvas as an argument
  * `#jsonOn:` is in Seaside-JSON-Core
  * `JSJsonParser` was renamed to `WAJsonParser`
  * `WACookie >> #oldNetscapeStringWithoutKey` is now in Seaside-Adaptors-Comanche
  * `WAUrl` >> #pathString is deprecated, use either `#pathStringUnencoded` or `#pathStringEncodedWith:`
  * The default doctype is now html5

## Server Adaptors ##
  * if your server supports access to the SSL session id implement `#sslSessionIdFor:`
  * optionally you can implement `#resetIfPossible` and `#flush`
  * instead of using `WARequestCookie class >> #fromString:` you should use `WARequestCookie class >> #fromString:codec:`, this has also been added to the latest versions of Seaside 3.0

## Porters ##
  * `GRPlatform >> #includesUnsafeUrlCharacter:` and `#includesUnsafeXmlCharacter:` are no longer used. They are replaced by `GRPlatform >> #xmlEncoderOn:`, `#urlEncoderOn:`, `#urlEncoderOn:codec:`, and `#jsonEncoderOn:` which allow you to answer custom implementations. You don't have to do this, the old implementations are provided as default implementations.
  * There is a new `#sourceFileEncoding` method on `GRPlatform` that is used by the file library to save the conent of uploaded files into methods. It defaults to ISO-8859-1 which is what was hard coded in Seaside 3.0.

## Dependencies ##
  * `Seaside-JSON-Core` along `Seaside-Pharo-JSON-Core` is now in the Seaside 3.1 repository
  * `#callback:json:` was moved from `JQuery-Core` to `JQuery-JSON` which depends on `Seaside-JSON-Core`
  * `Seaside-HTML5` has been merged into `Seaside-Canvas` and `Seaside-Core`