tests
testPeek
	self assert: consumer peek = 'tweets'.
	self assert: consumer peek = 'tweets'.
	consumer next.
	self assert: consumer peek = 'kentbeck'.
	self assert: consumer peek = 'kentbeck'.
	consumer next.
	self should: [ consumer peek ] raise: Error