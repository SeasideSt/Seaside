Extension { #name : #BlockClosure }

{ #category : #'*seaside-gemstone-development' }
BlockClosure >> equivalentTo: aBlock [
	"Squeak compatibility for lightweight callbacks"
	
	^self == aBlock
]
