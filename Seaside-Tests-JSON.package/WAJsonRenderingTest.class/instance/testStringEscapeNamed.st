tests
testStringEscapeNamed
	| backSpace formFeed lineFeed carriageReturn horizontalTab |
	backSpace := Character codePoint: 8.
	horizontalTab := Character codePoint: 9.
	lineFeed := Character codePoint: 10.
	formFeed := Character codePoint: 12.
	carriageReturn := Character codePoint: 13.
	self
		assert: [ :json |
			json array: [
				json value: (String streamContents: [ :stream |
					stream
						nextPut: backSpace;
						nextPut: horizontalTab;
						nextPut: lineFeed;
						nextPut: formFeed;
						nextPut: carriageReturn ]) ] ]
		gives: '["\b\t\n\f\r"]'