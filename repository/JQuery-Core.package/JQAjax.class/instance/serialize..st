convenience
serialize: aQuery
	"Serializes a set of input elements matching aQuery and trigger the associated Seaside callbacks."

	self enableCallbacks.
	self addParameter: aQuery serialize