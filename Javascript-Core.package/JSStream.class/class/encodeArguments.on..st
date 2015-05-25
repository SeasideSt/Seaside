encoding
encodeArguments: aCollection on: aStream 
	"Writes aCollection of elements to aStream enclosed in round brakes and separated by a comma."
	
	aStream nextPut: $(.
	aCollection
		do: [ :each | aStream javascript: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPut: $)