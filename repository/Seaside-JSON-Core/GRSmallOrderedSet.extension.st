Extension { #name : #GRSmallOrderedSet }

{ #category : #'*seaside-json-core' }
GRSmallOrderedSet >> jsonOn: aRenderer [
	aRenderer array: [
		self do: [ :each |
			aRenderer value: each ] ]
]
