asserting
assert: anObject equals: anOtherObject
	self
		assert: anObject = anOtherObject
		description: anObject greaseString, ' expected to be ', anOtherObject greaseString
		resumable: true