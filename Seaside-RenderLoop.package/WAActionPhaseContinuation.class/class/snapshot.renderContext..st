instance creation
snapshot: aSnapshot renderContext: aRenderContext
	^ self basicNew
		initializeWithSnapshot: aSnapshot renderContext: aRenderContext;
		yourself