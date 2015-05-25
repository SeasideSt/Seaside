private
assert: aBlock gives: aString
	| html |
	html := self builder
		render: aBlock.
	self
		assert: html = aString
		description:	 'Expected: ', aString printString, ', Actual: ', html printString
		resumable: true