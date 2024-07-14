tests-transform
testCookieConversionRule

	| class |
	class := self
		defineClass: #WASlimeServerAdaptor
		superclass: #WAServerAdaptor.
	self compile: 'method1 WACookie new oldNetscapeString' in: class.
	self compile: 'method2 WACookie new rfc2109String' in: class.
	self compile: 'method3 WACookie new rfc2965String' in: class.
	self 
		runTransformation: WACookieConversionRule
		changes: #(
			'method1 WACookie new rfc6265String'
			'method2 WACookie new rfc6265String'
			'method3 WACookie new rfc6265String'
		)