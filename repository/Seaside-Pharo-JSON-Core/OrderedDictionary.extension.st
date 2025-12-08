Extension { #name : 'OrderedDictionary' }

{ #category : '*Seaside-Pharo-JSON-Core' }
OrderedDictionary >> jsonOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
