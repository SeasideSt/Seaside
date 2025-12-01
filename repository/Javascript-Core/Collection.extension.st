Extension { #name : 'Collection' }

{ #category : '*javascript-core' }
Collection >> javascriptOn: aRenderer [
	aRenderer array: [
		self do: [ :each |
			 aRenderer value: each ] ]
]
