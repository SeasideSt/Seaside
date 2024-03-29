Extension { #name : 'Object' }

{ #category : '*seaside-json-core' }
Object >> asJson [
	^ WAJsonCanvas builder render: [ :json |
		self jsonOn: json ]
]

{ #category : '*Seaside-JSON-Core' }
Object >> jsonKeyOn: aRenderer [

	self error: 'Only Strings can be used as keys in JSON objects.'
]

{ #category : '*seaside-json-core' }
Object >> jsonOn: aRenderer [
	self error: 'Override #jsonOn: to make the receiver serializeable as JSON'
]
