writing
openTag: aString attributes: anAttributes closed: aBoolean
	"Open the XML tag named aString with the attribute dictionary anAttributes. Immediately close the tag if aBoolean is true."
	
	stream nextPut: $<; nextPutAll: aString.
	anAttributes encodeOn: self.
	aBoolean ifTrue: [ stream nextPut: $/ ].
	stream nextPut: $>