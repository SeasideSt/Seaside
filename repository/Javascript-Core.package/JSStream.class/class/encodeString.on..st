encoding
encodeString: aString on: aStream
	"Strings have a complicated encoding in Javascript, try to optimize their serialization."

	aStream nextPut: $".
	(aString indexOf: $<) = 0
		ifTrue: [ self encodeString: aString fastOn: aStream ]
		ifFalse: [ self encodeString: aString slowOn: aStream ].
	aStream nextPut: $"