Extension { #name : #Dictionary }

{ #category : #'*seaside-json-core' }
Dictionary >> jsonOn: aRenderer [
	aRenderer object: [
		self keysAndValuesDo: [ :key :value |
			aRenderer key: key value: value ] ]
]
