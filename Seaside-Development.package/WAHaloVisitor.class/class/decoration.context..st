instance creation
decoration: aToolDecoration context: aRenderContext
	^ self basicNew
		initializeWithToolDecoration: aToolDecoration renderContext: aRenderContext;
		yourself