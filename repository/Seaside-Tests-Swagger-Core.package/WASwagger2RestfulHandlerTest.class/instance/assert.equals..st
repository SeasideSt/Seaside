private
assert: anObject equals: aString
	self
		assert: anObject = aString
		description: anObject printString, ' expected to be ', aString printString
		resumable: true