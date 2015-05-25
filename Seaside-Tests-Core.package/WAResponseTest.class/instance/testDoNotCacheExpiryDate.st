tests-cache
testDoNotCacheExpiryDate
	| expiry delta |
	expiry := self response doNotCacheExpiryDate.
	delta := expiry - DateAndTime now.
	self assert: delta days < -7