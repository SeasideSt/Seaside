instance creation
configuration: aUserConfiguration canvas: aRenderCanvas
	^ self basicNew
		initializeWithConfiguration: aUserConfiguration canvas: aRenderCanvas;
		yourself