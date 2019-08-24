private
privateSetBrowserSessionID: aRequestContext
	"If there already is a browser session cookie, we reuse this one. 
	This means we can have multiple sessions open in a single browser, because they share the browser session id."
	(aRequestContext request cookieAt: self class browserSessionIDCookieKey)
		ifNotNil: [ :cookie | self privateBrowserSessionID: cookie value ]
		ifNil: [
				self privateBrowserSessionID: (WAKeyGenerator current keyOfLength: self privateBrowserSessionIDSize).
				aRequestContext response
					addCookie:
						(aRequestContext newCookie
							path: '/';
							key: self class browserSessionIDCookieKey;
							secure: false;
							value: self browserSessionID);
					redirectTo: (aRequestContext request url copy
										addField: self application trackingStrategy keyField value: self session key;
										addField: 'cookiecheck' value: nil; 
										yourself) ]