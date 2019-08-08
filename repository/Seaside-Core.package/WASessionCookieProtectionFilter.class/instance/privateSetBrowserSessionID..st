private
privateSetBrowserSessionID: aRequestContext
	"If there already is a browser session cookie, we reuse this one. 
	We can associate multiple session with a single browser session."
	(aRequestContext request cookieAt: self class browserSessionIDCookieKey)
		ifNotNil: [ :cookie | self privateBrowserSessionID: cookie value ]
		ifNil: [
				self privateBrowserSessionID: (WAKeyGenerator current keyOfLength: self privateBrowserSessionIDSize).
				aRequestContext response
					addCookie:
						(aRequestContext newCookie
							path: '/';
							key: self class browserSessionIDCookieKey;
							secure: GRPlatform current isPharo not;
							value: self browserSessionID);
					redirectTo: (aRequestContext request url copy
										addField: self application keyField value: self session key;
										addField: 'cookiecheck' value: nil; 
										yourself) ]