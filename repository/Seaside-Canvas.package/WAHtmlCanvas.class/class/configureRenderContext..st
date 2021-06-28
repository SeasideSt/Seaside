delegation
configureRenderContext: aWARenderContext
	"We set aWARenderContext to use a rendering guide as visitor."
		
	aWARenderContext visitor: (WARenderingGuide client: aWARenderContext visitor).