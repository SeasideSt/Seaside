encoding - private
encodeLessThanIn: aString at: anInteger on: aStream
	"Encode <, answer the number of characters coded"

	#('<!--' '<script' '</script') do: [ :each |
		(self hasString: aString subString: each at: anInteger) ifTrue: [
			aStream nextPutAll: '\x3C'.
			aStream greaseNext: each size - 1 putAll: each startingAt: 2.
			^ each size ]. ].
	aStream nextPut: $<.
	^ 1