private
assert: anObject equals: aString
	self
		assert: anObject = aString
		description: anObject, ' expected to be ', aString
		resumable: true