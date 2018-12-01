Extension { #name : #SocketStream }

{ #category : #'*seaside-adaptors-comanche' }
SocketStream >> basicNextPut: anObject [
	^ self nextPut: anObject
]

{ #category : #'*seaside-adaptors-comanche' }
SocketStream >> basicNextPutAll: anObject [
	^ self nextPutAll: anObject
]

{ #category : #'*seaside-adaptors-comanche' }
SocketStream >> size [
	"This is just a guess, probably more was written."

	^ outNextToWrite
]
