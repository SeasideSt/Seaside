Extension { #name : #ScaledDecimal }

{ #category : #'*Seaside-JSON-Core' }
ScaledDecimal >> jsonOn: aRenderer [
	aRenderer scaledDecimal: self
]
