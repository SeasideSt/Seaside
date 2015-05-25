accessing
rendererClass
	^ rendererClass ifNil: [ rendererClass := WARenderer default ]