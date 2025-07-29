public
with: anObject

	self openBrush.
	super with: [
		canvas render: anObject ].
	self closeBrush