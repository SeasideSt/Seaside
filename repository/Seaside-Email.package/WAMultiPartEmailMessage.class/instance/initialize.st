initialization
initialize
	| mimeParameters |
	super initialize.
	boundary := self class newBoundary.
	mimeParameters := Dictionary new.
	mimeParameters at: 'boundary' put: boundary.
	self headerAt: 'Content-Type' put: (WAMimeType main: 'multipart' sub: 'alternative' parameters: mimeParameters)