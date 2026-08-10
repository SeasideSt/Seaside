private
newHandler
	| application |
	application := WAApplication new.
	application configuration
		addParent: WARenderLoopConfiguration instance.
	^ application
		rootClass: WACounter;
		scriptGeneratorClass: WAInlineScriptGenerator;
		preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation;
		yourself