private
assertCookieInContext: aRequestContext withValue: aString
	| cookies cookie |
	cookies := aRequestContext response cookies.
	self assert: cookies size = 1.
	cookie := cookies first.
	self assert: cookie key = strategy keyCookieName.
	self assert: cookie value = aString