Extension { #name : #OrderedDictionary }

{ #category : #'*Javascript-Pharo70-Extensions' }
OrderedDictionary >> javascriptOn: aStream [
	JSStream encodeDictionary: self on: aStream
]
