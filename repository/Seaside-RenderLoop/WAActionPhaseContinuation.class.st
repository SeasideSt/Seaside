Class {
	#name : #WAActionPhaseContinuation,
	#superclass : #WARenderLoopContinuation,
	#instVars : [
		'renderContext'
	],
	#category : 'Seaside-RenderLoop'
}

{ #category : #private }
WAActionPhaseContinuation class >> defaultRenderContext [
	^ nil
]

{ #category : #testing }
WAActionPhaseContinuation class >> isActionContinuation [
	^ true
]

{ #category : #'instance creation' }
WAActionPhaseContinuation class >> snapshot: aSnapshot [
	^ self snapshot: aSnapshot renderContext: self defaultRenderContext
]

{ #category : #'instance creation' }
WAActionPhaseContinuation class >> snapshot: aSnapshot renderContext: aRenderContext [
	^ self basicNew
		initializeWithSnapshot: aSnapshot renderContext: aRenderContext;
		yourself
]

{ #category : #processing }
WAActionPhaseContinuation >> basicPerformAction [
	"Do nothing by default. Subclasses can override."
]

{ #category : #processing }
WAActionPhaseContinuation >> continue [
	| renderContinuation |
	renderContinuation := self createRenderContinuation.
	renderContinuation captureState.
	self shouldRedirect
		ifTrue: [ self redirectToContinuation: renderContinuation ]
		ifFalse: [ renderContinuation handle: self requestContext ]
]

{ #category : #handling }
WAActionPhaseContinuation >> handleFiltered: aRequestContext [
	self performAction.
	self continue
]

{ #category : #initialization }
WAActionPhaseContinuation >> initializeWithSnapshot: aSnapshot renderContext: aRenderContext [
	self initializeWithSnapshot: aSnapshot.
	renderContext := aRenderContext
]

{ #category : #processing }
WAActionPhaseContinuation >> performAction [
	self withNotificationHandlerDo: [ self basicPerformAction ].
	self startTasks
]

{ #category : #accessing }
WAActionPhaseContinuation >> renderContext [
	^ renderContext
]

{ #category : #accessing }
WAActionPhaseContinuation >> renderContext: aRenderContext [
	renderContext := aRenderContext
]

{ #category : #private }
WAActionPhaseContinuation >> shouldRedirect [
	| request |
	request := self request.
	^ (request isGet and: [ request fields includesKey: '_n' ]) not
]

{ #category : #private }
WAActionPhaseContinuation >> startTasks [
	"Make sure that any new Tasks get executed"
	(WAVisiblePresenterGuide client: WATaskVisitor new) start: self presenter
]
