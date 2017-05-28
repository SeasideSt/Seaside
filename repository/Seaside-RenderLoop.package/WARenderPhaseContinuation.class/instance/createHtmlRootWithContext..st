private
createHtmlRootWithContext: aRenderContext
	^ (self application preferenceAt: #htmlRootClass) value context: aRenderContext
