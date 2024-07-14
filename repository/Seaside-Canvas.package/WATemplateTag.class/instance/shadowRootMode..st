attributes
shadowRootMode: aString
	"Creates a shadow root for the parent element. It is a declarative version of the Element.attachShadow() method and accepts the same enumerated values.
	
	open
		Exposes the internal shadow root DOM for JavaScript (recommended for most use cases).
		
	closed
		Hides the internal shadow root DOM from JavaScript."
	self attributeAt: 'shadowrootmode' put: aString