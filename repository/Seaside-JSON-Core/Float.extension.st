Extension { #name : #Float }

{ #category : #'*seaside-json-core' }
Float >> jsonOn: aRenderer [
	(self - self) = 0.0 "check for infinity, negative infinity and NaN"
		ifTrue: [ aRenderer number: self ]
		ifFalse: [ aRenderer null ]
]
