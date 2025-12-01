Extension { #name : 'Dictionary' }

{ #category : '*javascript-core' }
Dictionary >> javascriptOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			 aRenderer key: key value: value ] ]
]
