tests
testAtEnd
	self deny: consumer atEnd.
	consumer next.
	self deny: consumer atEnd.
	consumer next.
	self assert: consumer atEnd