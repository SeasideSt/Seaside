encoding - private
encodeNonAsciiCharacter: aCharacter withCodePoint: anInteger on: aStream
	"U+2028 and U+2029 have to be treated as new lines"

	anInteger = 16r2028 "Line separator"
		ifTrue: [ aStream nextPutAll: '\u2028' ]
		ifFalse: [
			anInteger = 16r2029 "Paragraph separator"
				ifTrue: [ aStream nextPutAll: '\u2029' ]
				ifFalse: [ aStream nextPut: aCharacter ] ]