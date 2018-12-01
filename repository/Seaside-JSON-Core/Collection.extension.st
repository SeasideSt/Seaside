Extension { #name : #Collection }

{ #category : #'*seaside-json-core' }
Collection >> jsonOn: aRenderer [ 
	aRenderer array: [
		self do: [ :each |
			aRenderer value: each ] ]
]
