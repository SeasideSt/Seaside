Extension { #name : #GRSmallDictionary2 }

{ #category : #'*seaside-json-core' }
GRSmallDictionary2 >> jsonOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
