Extension { #name : #Object }

{ #category : #'*seaside-json-core' }
Object >> asJson [
	^ WAJsonCanvas builder render: [ :json |
		self jsonOn: json ]
]

{ #category : #'*seaside-json-core' }
Object >> jsonOn: aRenderer [
	self error: 'Override #jsonOn: to make the receiver serializeable as JSON'
]
