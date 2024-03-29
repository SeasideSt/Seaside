Extension { #name : 'ZdcAbstractSocketStream' }

{ #category : '*Seaside-Zinc-Core' }
ZdcAbstractSocketStream >> crlf [
	self nextPutAll: String crlf
]

{ #category : '*Seaside-Zinc-Core' }
ZdcAbstractSocketStream >> space [
	self nextPut: Character space asciiValue
]
