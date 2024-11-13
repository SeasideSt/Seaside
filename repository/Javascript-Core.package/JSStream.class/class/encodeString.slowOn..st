encoding - private
encodeString: aString slowOn: aStream
	"Strings with < a complicated encoding in Javascript"

	| index size |
	index := 1.
	size := aString size.
	[ index <= size ] whileTrue: [
		| char value encoded |
		char := aString at: index.
		value := char greaseInteger.
		value < JavascriptCharacters size
			ifFalse: [
				self encodeNonAsciiCharacter: char withCodePoint: value on: aStream.
				index := index + 1. ]
			ifTrue: [
				encoded := JavascriptCharacters at: value + 1.
				"we use nil markers becausee #isNil is faster than #isString because it's not
				actually sent"
				encoded isNil
					ifTrue: [
						"avoid that browsers mistakenly take the output as a closing tag"
  						char = $<
							ifTrue: [
								index := index + (self encodeLessThanIn: aString at: index on: aStream) ]
							ifFalse: [
								aStream nextPut: char.
								index := index + 1. ] ]
					ifFalse: [
						aStream nextPutAll: encoded.
						index := index + 1 ] ] ]