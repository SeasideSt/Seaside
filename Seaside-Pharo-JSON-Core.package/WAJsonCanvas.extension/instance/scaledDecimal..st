*seaside-pharo-json-core
scaledDecimal: aScaledDecimal
	| converter |
	converter := GRNumberPrinter new precision: aScaledDecimal scale.
	converter print: aScaledDecimal on: self document stream