tests
testPeekToEnd
	| result |
	result := Array with: 'tweets' with: 'kentbeck'.
	self assert: consumer peekToEnd = result.
	self deny: consumer atEnd.
	self assert: consumer next = 'tweets'.
	self assert: consumer next = 'kentbeck'.
	self assert: consumer atEnd