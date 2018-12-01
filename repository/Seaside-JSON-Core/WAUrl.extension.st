Extension { #name : #WAUrl }

{ #category : #'*seaside-json-core' }
WAUrl >> jsonOn: aRenderer [
	aRenderer string: self printString
]
