accessing
at: anInteger

	| wrappedPosition |
	self checkBoundsFor: anInteger.
	wrappedPosition := ((anInteger + offset - 1) rem: buffer size) + 1.
	^ buffer at: wrappedPosition