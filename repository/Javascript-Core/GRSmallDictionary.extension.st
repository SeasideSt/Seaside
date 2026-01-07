Extension { #name : 'GRSmallDictionary' }

{ #category : '*javascript-core' }
GRSmallDictionary >> javascriptOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
