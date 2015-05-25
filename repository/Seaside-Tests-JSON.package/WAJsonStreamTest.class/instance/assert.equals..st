asserting
assert: anObject equals: aString
	self
		assert: anObject asJson = aString
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true