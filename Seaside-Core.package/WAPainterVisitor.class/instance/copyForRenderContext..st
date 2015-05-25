copying
copyForRenderContext: aRenderContext 
	"Return a copy, making sure that references to a RenderContext are replaced
	with aRenderContext."
	
	^ self copy
		postCopyForRenderContext: aRenderContext;
		yourself