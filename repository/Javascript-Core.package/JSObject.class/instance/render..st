utilities
render: aRenderable
	"Render aRenderable and answer the resulting string."
	
	^ String streamContents: [ :stream | self render: aRenderable on: stream ]