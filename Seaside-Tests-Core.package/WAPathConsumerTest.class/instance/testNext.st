tests
testNext
	self assert: consumer next = 'tweets'.
	self assert: consumer next = 'kentbeck'.
	self should: [ consumer next ] raise: Error