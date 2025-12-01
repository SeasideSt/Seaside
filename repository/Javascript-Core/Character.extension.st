Extension { #name : 'Character' }

{ #category : '*javascript-core' }
Character >> javascriptOn: aRenderer [
	aRenderer string: (String with: self)
]
