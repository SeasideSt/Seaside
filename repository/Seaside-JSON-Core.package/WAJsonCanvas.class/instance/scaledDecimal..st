double-dispatch
scaledDecimal: aScaledDecimal
	| converter |
	converter := GRSignPrinter new, (GRNumberPrinter new precision: aScaledDecimal scale).
	converter print: aScaledDecimal on: self document stream