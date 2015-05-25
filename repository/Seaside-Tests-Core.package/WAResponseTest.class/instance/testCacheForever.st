tests-cache
testCacheForever
	self response cacheForever.
	self assert: (self response headerAt: 'Pragma') isNil.
	self assert: (self response headerAt: 'Expires') notNil.
	self assert: (self response headerAt: 'Cache-Control') isNil