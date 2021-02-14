Extension { #name : #GRSmallDictionary }

{ #category : #'*seaside-json-core' }
GRSmallDictionary >> jsonOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
