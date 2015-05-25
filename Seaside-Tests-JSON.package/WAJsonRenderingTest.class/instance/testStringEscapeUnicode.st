tests
testStringEscapeUnicode
	| lineSeparator paragraphSeparator snowMan |
	lineSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	paragraphSeparator := Character codePoint: 16r2028.
	snowMan := Character codePoint: 16r2603.
	self
		assert: [ :json |
			json array: [
				json value: (String streamContents: [ :stream |
					stream
						nextPut: lineSeparator;
						nextPut: paragraphSeparator;
						nextPut: snowMan ]) ] ]
		gives: '["', (String with: lineSeparator), (String with: paragraphSeparator), (String with: snowMan), '"]'