Extension { #name : 'Duration' }

{ #category : '*javascript-core' }
Duration >> javascriptOn: aRenderer [
	aRenderer render: self asMilliseconds
]
