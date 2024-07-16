encoding - private
encodeString: aString fastOn: aStream
	"Encode a String without <, much simpler implementation that can use #to:do"

	1 to: aString size do: [ :index |
		| char value encoded |
		char := aString at: index.
		value := char greaseInteger.
		value < JavascriptCharacters size
			ifFalse: [
				self encodeNonAsciiCharacter: char withCodePoint: value on: aStream ]
			ifTrue: [
				encoded := JavascriptCharacters at: value + 1.
				"we use nil markers becausee #isNil is faster than #isString because it's not
				actually sent"
				encoded isNil
					ifTrue: [ aStream nextPut: char ]
					ifFalse: [ aStream nextPutAll: encoded ] ] ]