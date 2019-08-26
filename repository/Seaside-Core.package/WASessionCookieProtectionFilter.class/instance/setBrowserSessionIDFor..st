private
setBrowserSessionIDFor: aRequestContext
	"If there already is a browser session cookie, we reuse this one. 
	This means we can have multiple sessions open in a single browser, because they share the browser session id."
	(aRequestContext request cookieAt: self browserSessionIDCookieKey)
		ifNotNil: [ :cookie | browserSessionID := cookie value ]
		ifNil: [
				browserSessionID := self newBrowserSessionID.
				aRequestContext response
					addCookie: (self createBrowserSessionIDCookieFor: aRequestContext);
					redirectTo: (self cookieCheckUrlFor: aRequestContext) ]