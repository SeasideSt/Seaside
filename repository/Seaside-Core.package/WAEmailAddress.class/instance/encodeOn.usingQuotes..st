private
encodeOn: aStream usingQuotes: aBoolean
	username isNil ifFalse:  [
		aBoolean ifTrue: [ aStream nextPut: $" ].
		aStream nextPutAll: username.
		aBoolean ifTrue: [ aStream nextPut: $" ].
		aStream nextPutAll: ' <' ].
	aStream nextPutAll: address.
	username isNil ifFalse: [ aStream nextPut: $> ]