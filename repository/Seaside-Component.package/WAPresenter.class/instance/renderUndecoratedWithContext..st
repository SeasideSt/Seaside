rendering
renderUndecoratedWithContext: aRenderContext
	"Render ourselves directly on aRenderer without allowing our Decorations to be visited."
	
	self accept: aRenderContext visitor