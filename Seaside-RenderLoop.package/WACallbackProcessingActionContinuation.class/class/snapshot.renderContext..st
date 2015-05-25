instance creation
snapshot: aSnapshot renderContext: aRenderContext
	aRenderContext isNil ifTrue: [ self error: 'Objects of this class require a RenderContext for callback processing.' ].
	^ super snapshot: aSnapshot renderContext: aRenderContext