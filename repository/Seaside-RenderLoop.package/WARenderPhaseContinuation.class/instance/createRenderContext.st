private
createRenderContext
	| renderContext |
	renderContext := WARenderContext new.
	
	"Wrap the default visitor with a rendering guide"
	renderContext visitor: (WARenderingGuide client: renderContext visitor).
	
	^ renderContext
		