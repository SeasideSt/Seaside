description
describeOn: config
	(config classBinding: #actionPhaseContinuationClass)
		beAdvanced;
		group: #renderLoop;
		comment: 'The continuation used for the Render Loop''s action phase.';
		options: [ self actionPhaseContinuationClasses ];
		default: WACallbackProcessingActionContinuation.
	(config classBinding: #renderPhaseContinuationClass)
		beAdvanced;
		group: #renderLoop;
		comment: 'The continuation used for the Render Loop''s render phase.';
		options: [ self renderPhaseContinuationClasses ];
		default: WARenderPhaseContinuation.
	(config classBinding: #rootClass)
		comment: 'The root component of this seaside application.';
		options: [ self rootClasses ].
	(config classBindingCollection: #rootDecorationClasses)
		comment: 'The decoration clases that should wrap the root component.';
		options: [ self rootDecorationClasses ].
	config
		at: #initialContinuationClass
		putClass: WAInitialRenderLoopContinuation.
	(config classBinding: #htmlRootClass)
		comment: 'The class responsible for creating header and footer of the HTML document.';
		options: [ self htmlRootClasses ];
		default: WAHtmlRoot