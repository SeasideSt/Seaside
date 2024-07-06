attributes
shadowRootClonable: aBoolean
	"Sets the value of the clonable property of a ShadowRoot created using this element to true. If set, a clone of the shadow host (the parent element of this <template>) created with Node.cloneNode() or Document.importNode() will include a shadow root in the copy."
	self attributeAt: 'shadowrootclonable' put: aBoolean