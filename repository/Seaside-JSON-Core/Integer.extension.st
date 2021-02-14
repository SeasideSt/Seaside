Extension { #name : #Integer }

{ #category : #'*seaside-json-core' }
Integer >> jsonOn: aRenderer [
	aRenderer number: self
]
