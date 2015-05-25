private
assertCookieDeletion: aResponse
	| cookie |
	self assert: aResponse cookies size = 1.
	cookie := aResponse cookies first.
	self assert: cookie path = self path.
	self assert: cookie key = self cookieKey.
	self assert: cookie expiry < (DateAndTime now - (Duration days: 1 hours: 0 minutes: 0 seconds: 0)).
	self deny: cookie discard