instance creation
snapshot: aSnapshot renderContext: aRenderContext action: aValuable
	^ self basicNew
		initializeWithSnapshot: aSnapshot renderContext: aRenderContext action: aValuable;
		yourself