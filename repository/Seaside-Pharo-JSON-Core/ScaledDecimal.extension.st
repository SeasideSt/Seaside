Extension { #name : #ScaledDecimal }

{ #category : #'*seaside-pharo-json-core' }
ScaledDecimal >> jsonOn: aRenderer [
	aRenderer scaledDecimal: self
]
