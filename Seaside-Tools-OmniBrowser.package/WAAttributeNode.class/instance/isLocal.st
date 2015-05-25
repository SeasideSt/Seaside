testing
isLocal 
	"True if the attribute is defined on this configuration"
	self configuration localAttributeAt: self attribute key ifAbsent: [ ^ false ].
	^ true