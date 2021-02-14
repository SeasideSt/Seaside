Extension { #name : #GRSmallDictionary }

{ #category : #'*javascript-core' }
GRSmallDictionary >> javascriptOn: aStream [
	JSStream encodeDictionary: self on: aStream
]
