public
with: anObject
	"Render anObject into the receiver. Make sure that you call #with: last in the cascade, as this method will serialize the tag onto the output document."

	self openTag.
	super with: [
		self before.
		canvas render: anObject.
		self after ].
	self isClosed
		ifFalse: [ self closeTag ]