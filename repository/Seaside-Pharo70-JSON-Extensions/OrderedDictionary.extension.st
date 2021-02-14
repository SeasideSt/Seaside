Extension { #name : #OrderedDictionary }

{ #category : #'*Seaside-Pharo70-JSON-Extensions' }
OrderedDictionary >> jsonOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
