public
bracketProperty: aStringOrInteger
	self document openBracket.
	self render: aStringOrInteger.
	self document closeBracket