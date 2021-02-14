Extension { #name : #TransientValue }

{ #category : #'*seaside-gemstone-core' }
TransientValue >> contents [
	"Needs to adhere to WAValueHolder protocol"
	^ self value
]

{ #category : #'*seaside-gemstone-core' }
TransientValue >> contents: anObject [
	"Needs to adhere to WAValueHolder protocol"
	^ self value: anObject
]
