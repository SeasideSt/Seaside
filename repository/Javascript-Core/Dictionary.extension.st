Extension { #name : #Dictionary }

{ #category : #'*javascript-core' }
Dictionary >> javascriptOn: aStream [
	JSStream encodeDictionary: self on: aStream
]
