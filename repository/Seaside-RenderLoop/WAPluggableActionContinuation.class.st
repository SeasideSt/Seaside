"
This continuation executes an action (any class that implements #value or #value:). If possible, the renderContext is passed in as an argument. When the action is complete, if a response hasn't been returned, control is passed to a render continuation.'

Instance Variables:
	action	<BlockClosure | BlockContext | GRDelayedSend | MessageSend | WAContinuation | WAPartialContinuation>
"
Class {
	#name : #WAPluggableActionContinuation,
	#superclass : #WAActionPhaseContinuation,
	#instVars : [
		'action'
	],
	#category : 'Seaside-RenderLoop'
}

{ #category : #'instance creation' }
WAPluggableActionContinuation class >> action: aValuable [
	^ self snapshot: self defaultSnapshot renderContext: self defaultRenderContext action: aValuable
]

{ #category : #private }
WAPluggableActionContinuation class >> defaultAction [
	^ GRDelayedSend empty
]

{ #category : #'instance creation' }
WAPluggableActionContinuation class >> snapshot: aSnapshot renderContext: aRenderContext [
	^ self snapshot: aSnapshot renderContext: aRenderContext action: self defaultAction
]

{ #category : #'instance creation' }
WAPluggableActionContinuation class >> snapshot: aSnapshot renderContext: aRenderContext action: aValuable [
	^ self basicNew
		initializeWithSnapshot: aSnapshot renderContext: aRenderContext action: aValuable;
		yourself
]

{ #category : #processing }
WAPluggableActionContinuation >> basicPerformAction [
	^ action valueWithPossibleArguments: (Array with: renderContext)
]

{ #category : #initialization }
WAPluggableActionContinuation >> initializeWithSnapshot: aSnapshot renderContext: aRenderContext action: aValuable [
	self initializeWithSnapshot: aSnapshot renderContext: aRenderContext.
	action := aValuable
]
