asserting
assert: anObject gives: aString
	self
		assert: anObject asJson = aString
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true