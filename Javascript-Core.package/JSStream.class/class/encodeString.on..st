encoding
encodeString: aString on: aStream 
	"Strings have a complicated encoding in Javascript, try to optimize their serialization."
		
	aStream nextPut: $".
	1 to: aString size do: [ :index | 
		| char value encoded |
		char := aString at: index.
		value := char greaseInteger.
		value < JavascriptCharacters size 
			ifFalse: [
				"U+2028 and U+2029 have to be treaded as new lines"
				value = 16r2028 "Line separator"
					ifTrue: [ aStream nextPutAll: '\u2028' ]
					ifFalse: [
						value = 16r2029 "Paragraph separator"
							ifTrue: [ aStream nextPutAll: '\u2029' ]
							ifFalse: [ aStream nextPut: char ] ] ]
			ifTrue: [
				encoded := JavascriptCharacters at: value + 1.
				"we use nil markers becausee #isNil is faster than #isString because it's not
				actually sent"
				encoded isNil 
					ifTrue: [ aStream nextPut: char ]
					ifFalse: [ aStream nextPutAll: encoded ] ] ].
	aStream nextPut: $"