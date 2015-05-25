*seaside-tests-utf8
asString: aCollectionOfIntegers
	^ String streamContents: [ :stream |
		aCollectionOfIntegers do: [ :each |
			stream nextPut: (Character codePoint: each) ] ]