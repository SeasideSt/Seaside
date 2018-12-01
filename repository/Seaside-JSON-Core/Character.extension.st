Extension { #name : #Character }

{ #category : #'*seaside-json-core' }
Character >> jsonOn: aRenderer [
	aRenderer string: (String with: self)
]
