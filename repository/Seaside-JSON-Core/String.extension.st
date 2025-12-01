Extension { #name : 'String' }

{ #category : '*seaside-json-core' }
String >> jsonKeyOn: aRenderer [
	self jsonOn: aRenderer
]

{ #category : '*seaside-json-core' }
String >> jsonOn: aRenderer [
	aRenderer string: self
]
