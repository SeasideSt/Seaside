converting
requestCookiesFor: aZincRequest
	| cookieString |
	cookieString := aZincRequest headers
		at: 'Cookie' ifAbsent: [ ^ #() ].
	^ WARequestCookie fromString: cookieString