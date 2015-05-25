writing-private
write: aString asQuotedStringOn: aStream

	aStream nextPut: $".
	aString do: [ :each |
		each = $" 
			ifTrue: [ aStream nextPutAll: '\"' ]
			ifFalse: [ aStream nextPut: each ] ].
	aStream nextPut: $"