"
WARenderLoopConfiguration defines attributes required by the Render Loop classes (see the Seaside-Core-RenderLoop category). Any application using these classes should include this configuration (this is done by default for new applications).

See #addAttributes: for details on provided attributes.
"
Class {
	#name : #WARenderLoopConfiguration,
	#superclass : #WASystemConfiguration,
	#category : 'Seaside-RenderLoop'
}

{ #category : #description }
WARenderLoopConfiguration >> actionPhaseContinuationClasses [
	^ self continuationClasses select: [ :each | each isRenderLoopContinuation and: [ each isActionContinuation ] ]
]

{ #category : #description }
WARenderLoopConfiguration >> continuationClasses [
	^ WAApplicationConfiguration instance continuationClasses
]

{ #category : #description }
WARenderLoopConfiguration >> describeOn: config [
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
		at: #initialContinuationClass putClass: WAInitialRenderLoopContinuation
]

{ #category : #ancestry }
WARenderLoopConfiguration >> parents [
	"We override several attributes of the application configuration."
	^ Array with: WAApplicationConfiguration instance
]

{ #category : #description }
WARenderLoopConfiguration >> renderPhaseContinuationClasses [
	^ self continuationClasses select: [ :each | each isRenderLoopContinuation and: [ each isRenderContinuation ] ]
]

{ #category : #description }
WARenderLoopConfiguration >> rootClasses [
	^ (WAComponent allSubclasses select: [ :each | each canBeRoot ])
		asSortedCollection: [ :a :b | a name <= b name ]
]

{ #category : #description }
WARenderLoopConfiguration >> rootDecorationClasses [
	^ (WADecoration allSubclasses select: [ :each | each canBeRoot ])
		asSortedCollection: [ :a :b | a name <= b name ]
]
