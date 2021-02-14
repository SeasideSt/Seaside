Extension { #name : #UndefinedObject }

{ #category : #'*javascript-core' }
UndefinedObject >> javascriptOn: aStream [
	aStream nextPutAll: 'null'
]
