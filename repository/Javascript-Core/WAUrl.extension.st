Extension { #name : #WAUrl }

{ #category : #'*javascript-core' }
WAUrl >> javascriptOn: aStream [ 
	aStream javascript: self printString
]
