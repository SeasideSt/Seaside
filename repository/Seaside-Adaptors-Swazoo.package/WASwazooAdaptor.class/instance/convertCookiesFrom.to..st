private
convertCookiesFrom: aWAResponse to: aSwazooResponse
	| cookies setCookieField |
	cookies := aWAResponse cookies.
	cookies isEmpty ifTrue: [ ^ self ].
	
	setCookieField := WorkingHTTPSetCookieField new.

	cookies do: [ :each |
		setCookieField addCookie: each rfc6265String ].
	
	aSwazooResponse headers addField: setCookieField