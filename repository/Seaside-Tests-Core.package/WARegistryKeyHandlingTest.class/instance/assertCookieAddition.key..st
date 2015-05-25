private
assertCookieAddition: aResponse key: aString
	self assertCookieAddition: aResponse.
	self assert: aResponse cookies first value = aString