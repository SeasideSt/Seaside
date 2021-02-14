Extension { #name : #GRSmallDictionary2 }

{ #category : #'*javascript-core' }
GRSmallDictionary2 >> javascriptOn: aStream [
	JSStream encodeDictionary: self on: aStream
]
