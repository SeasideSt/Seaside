asserting
assert: anObject equals: aString
	self
		assert: anObject asJavascript = aString
		description: anObject asJavascript printString , ' expected to be ' , aString printString
		resumable: true