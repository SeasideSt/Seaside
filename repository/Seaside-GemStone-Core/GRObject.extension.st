Extension { #name : #GRObject }

{ #category : #'*seaside-gemstone-core' }
GRObject >> asString [

	^self printString
]

{ #category : #'*seaside-gemstone-core' }
GRObject >> printOn: aStream [
	
	aStream nextPutAll: super asString
]
