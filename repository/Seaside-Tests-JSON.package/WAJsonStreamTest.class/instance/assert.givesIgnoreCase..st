asserting
assert: anObject givesIgnoreCase: aString
	self
		assert: anObject asJson asLowercase = aString asLowercase
		description: anObject asJson , ' expected to be ' , aString greaseString
		resumable: true