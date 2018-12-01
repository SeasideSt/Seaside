Extension { #name : #WAJsonCanvas }

{ #category : #'*seaside-pharo-json-core' }
WAJsonCanvas >> scaledDecimal: aScaledDecimal [
	| converter |
	converter := GRNumberPrinter new precision: aScaledDecimal scale.
	converter print: aScaledDecimal on: self document stream
]
