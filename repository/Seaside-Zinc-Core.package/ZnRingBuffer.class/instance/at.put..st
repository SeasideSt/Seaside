accessing
at: anInteger put: anObject

	| wrappedPosition |
	self checkBoundsFor: anInteger.
	wrappedPosition := ((anInteger + offset - 1) rem: buffer size) + 1.
	buffer
		at: wrappedPosition
		put: anObject