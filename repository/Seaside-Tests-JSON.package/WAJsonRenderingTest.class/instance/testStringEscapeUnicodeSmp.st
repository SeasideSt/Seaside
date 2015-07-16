tests
testStringEscapeUnicodeSmp
	| emoji |
	emoji := Character codePoint: 16r1F64C.
	self
		assert: [ :json |
			json array: [
				json value: (String streamContents: [ :stream |
					stream nextPut: emoji ]) ] ]
		gives: '["', (String with: emoji), '"]'