Extension { #name : 'GRSmallOrderedSet' }

{ #category : '*javascript-core' }
GRSmallOrderedSet >> javascriptOn: aRenderer [
	aRenderer array: [
		self do: [ :each |
			aRenderer value: each ] ]
]
