rendering
renderWithContext: aRenderContext
	"This is the main entry point when attempting to render a Painter.
	It should not normally be overridden. Subclasses should override #renderContentOn:.
	
	You DO NOT normally need to call this method directly. Usually you have an instance
	of a Renderer (e.g. a WAHtmlCanvas) and can call the #render: method."
	
	aRenderContext visitor visit: self