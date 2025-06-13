accessing-rendering
rendererClass
	"Answer the default renderer for this pusher."

	^ rendererClass ifNil: [ WARenderer default ]