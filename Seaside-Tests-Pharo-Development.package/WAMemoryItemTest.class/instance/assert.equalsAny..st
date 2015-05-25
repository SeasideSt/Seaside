asserting
assert: anObject equalsAny: aCollection
	self
		assert: (aCollection includes: anObject)
		description: anObject greaseString, ' expected to be any of ', aCollection greaseString
		resumable: true