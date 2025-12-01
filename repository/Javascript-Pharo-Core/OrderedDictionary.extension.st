Extension { #name : 'OrderedDictionary' }

{ #category : '*Javascript-Pharo-Core' }
OrderedDictionary >> javascriptOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
