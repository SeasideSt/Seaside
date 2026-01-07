Extension { #name : 'GRSmallDictionary2' }

{ #category : '*javascript-core' }
GRSmallDictionary2 >> javascriptOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
