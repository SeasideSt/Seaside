tests
testNextKey
	self assert: registry nextKey = '1'.
	registry increaseKey.
	self assert: registry nextKey = '2'.
	self assert: registry nextKey = '2'