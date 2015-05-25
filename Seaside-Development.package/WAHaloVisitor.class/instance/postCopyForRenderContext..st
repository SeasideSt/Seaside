copying
postCopyForRenderContext: aRenderContext
	super postCopyForRenderContext: aRenderContext.
	renderContext := aRenderContext.
	visitor := visitor copyForRenderContext: aRenderContext