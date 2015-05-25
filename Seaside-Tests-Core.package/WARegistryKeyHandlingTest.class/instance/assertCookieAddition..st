private
assertCookieAddition: aResponse
	| cookie |
	self assert: aResponse cookies size = 1.
	cookie := aResponse cookies first.
	self assert: cookie path = self path.
	self assert: cookie key = self cookieKey.
	self assert: cookie discard