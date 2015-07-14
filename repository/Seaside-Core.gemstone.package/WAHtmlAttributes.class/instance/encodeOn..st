encoding
encodeOn: aDocument
	"Encode the receivers attribute onto aDocument. Note that this implementation reqires those two checks for true and false exactly the way they are here, to reliable encode boolean attributes in an XHTML compliant way."

	self keysAndValuesDo: [ :key :value |
		value == false ifFalse: [
			aDocument nextPut: $ ; nextPutAll: key; nextPutAll: '="'.
			value == true
				ifTrue: [ aDocument nextPutAll: key ]
				ifFalse: [ aDocument print: value ].
			aDocument nextPut: $" ] ]