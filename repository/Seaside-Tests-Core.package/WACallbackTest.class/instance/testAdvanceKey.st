tests
testAdvanceKey
	self assert: registry advanceKey = '1'.
	self assert: registry advanceKey = '2'.
	self assert: registry advanceKey = '3'