Extension { #name : #BinaryFloat }

{ #category : #'*javascript-gemstone-core' }
BinaryFloat >> javascriptOn: aStream [

	self printOn: aStream base: 10
]
