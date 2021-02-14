Class {
	#name : #WACallbackProcessingActionContinuation,
	#superclass : #WAActionPhaseContinuation,
	#instVars : [
		'jumpTo'
	],
	#category : 'Seaside-RenderLoop'
}

{ #category : #'instance creation' }
WACallbackProcessingActionContinuation class >> snapshot: aSnapshot renderContext: aRenderContext [
	aRenderContext isNil ifTrue: [ self error: 'Objects of this class require a RenderContext for callback processing.' ].
	^ super snapshot: aSnapshot renderContext: aRenderContext
]

{ #category : #processing }
WACallbackProcessingActionContinuation >> basicPerformAction [
	super basicPerformAction.
	self renderContext callbacks handle: self requestContext
]

{ #category : #public }
WACallbackProcessingActionContinuation >> jumpToAnchor: aString [
	jumpTo := aString
]

{ #category : #processing }
WACallbackProcessingActionContinuation >> performAction [
	"Ajax requests modify the captured state - though this behaviour has been heavily debated"
	[ super performAction ] ensure: [
		self request isXmlHttpRequest ifTrue: [ self captureState ] ]
]

{ #category : #private }
WACallbackProcessingActionContinuation >> redirectToContinuation: aSessionContinuation [
	self respond: [ :response |
		| url |
		url := aSessionContinuation registerForUrl.
		jumpTo isNil ifFalse: [
			url fragment: jumpTo ].
		response redirectTo: url ]
]
