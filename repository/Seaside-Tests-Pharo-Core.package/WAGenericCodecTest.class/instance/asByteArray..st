private
asByteArray: aCollectionOfIntegers
	^ ByteArray streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: each ] ]