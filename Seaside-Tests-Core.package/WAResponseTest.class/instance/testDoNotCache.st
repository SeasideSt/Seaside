tests-cache
testDoNotCache
	self response doNotCache.
	self assert: (self response headerAt: 'Pragma') = 'no-cache'.
	self assert: (self response headerAt: 'Expires') notNil.
	self assert: (self response headerAt: 'Cache-Control') = 'no-cache, max-age=0, must-revalidate, no-store'