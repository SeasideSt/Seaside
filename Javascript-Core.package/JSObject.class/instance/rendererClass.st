accessing
rendererClass
	"Answer the class that should be used when rendering objects."

	^ rendererClass ifNil: [ rendererClass := WARenderer default ]