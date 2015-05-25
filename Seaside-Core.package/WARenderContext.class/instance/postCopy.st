copying
postCopy
	super postCopy.
	visitor := visitor copyForRenderContext: self.
	actionUrl := actionUrl copy.
	resourceUrl := resourceUrl copy.
	properties := properties copy