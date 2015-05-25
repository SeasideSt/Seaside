copying
postCopyForRenderContext: aRenderContext
	"self is a shallow copy. Subclasses should copy fields as necessary to complete
	the full copy and ensure that all references to the old RenderContext are replaced
	with aRenderContext. Note that #postCopy is also called prior to this method being called."