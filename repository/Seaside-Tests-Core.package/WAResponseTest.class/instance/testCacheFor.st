tests-cache
testCacheFor
	self response cacheFor: (Duration days: 1 hours: 0 minutes: 0 seconds: 0).
	self assert: (self response headerAt: 'Pragma') isNil.
	self assert: (self response headerAt: 'Expires') notNil.
	self assert: (self response headerAt: 'Cache-Control') = 'max-age=86400'