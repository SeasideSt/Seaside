tests-cache
testCacheForeverExpiryDate
	| expiry delta |
	expiry := self response cacheForeverExpiryDate.
	delta := expiry - DateAndTime now.
	self assert: delta days > 7.
	self assert: delta days < 356