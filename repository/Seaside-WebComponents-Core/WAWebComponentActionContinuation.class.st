"
I am a special action continuation with optimizations for web components.

Since web components have no back button and a full page reload results in an entire new page I perform the following optimizations.

- I do not redirect.
- I do not capture the state.
- I do not restore the state.
"
Class {
	#name : 'WAWebComponentActionContinuation',
	#superclass : 'WAActionPhaseContinuation',
	#category : 'Seaside-WebComponents-Core',
	#package : 'Seaside-WebComponents-Core'
}

{ #category : 'processing' }
WAWebComponentActionContinuation >> basicPerformAction [
	super basicPerformAction.
	self renderContext callbacks handle: self requestContext
]

{ #category : 'processing' }
WAWebComponentActionContinuation >> continue [
	"do not capture state"
	self createRenderContinuation handle: self requestContext
]

{ #category : 'public' }
WAWebComponentActionContinuation >> jumpToAnchor: aString [
	"Intentionally empty for compatibility with WACallbackProcessingActionContinuation"
]

{ #category : 'processing' }
WAWebComponentActionContinuation >> restoreState [
	"don't restore states"
]

{ #category : 'private' }
WAWebComponentActionContinuation >> shouldRedirect [
	^ false
]
