convenience
addMedia: aString
	"Add an additional intended destination medium aString to the receiver."

	self at: 'media' append: aString separator: ', '