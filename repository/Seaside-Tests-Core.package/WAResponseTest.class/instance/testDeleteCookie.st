tests-cache
testDeleteCookie
	| cookie actual |
	cookie := (WARequestCookie key: 'key' value: 'value')
		pathUnencoded: '/highway/to/hell' codec: GRNullCodec new;
		domain: 'hotel'
		yourself.
	self response deleteCookie: cookie.
	self assert: self response cookies size = 1.
	actual := self response cookies first.
	self assert: cookie ~~ actual.
	self assert: actual domain = 'hotel'.
	self assert: actual path = '/highway/to/hell'