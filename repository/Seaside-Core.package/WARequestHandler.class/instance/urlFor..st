accessing
urlFor: aRequestHandler
	"Return the URL for the given request handler, which should be a
	child of the receiver. The default implementation simply returns the
	receiver's URL, but subclasses should override to add a relevant
	paramter or path segment that identifies the particular chid."

	^ self url