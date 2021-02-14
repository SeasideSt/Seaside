Class {
	#name : #WARenderLoopContinuation,
	#superclass : #WASessionContinuation,
	#category : 'Seaside-RenderLoop'
}

{ #category : #testing }
WARenderLoopContinuation class >> isActionContinuation [
	^ false
]

{ #category : #testing }
WARenderLoopContinuation class >> isRenderContinuation [
	^ false
]

{ #category : #testing }
WARenderLoopContinuation class >> isRenderLoopContinuation [
	^ true
]

{ #category : #private }
WARenderLoopContinuation >> actionPhaseContinuationClass [

	^ (self application preferenceAt: #actionPhaseContinuationClass) value
]

{ #category : #private }
WARenderLoopContinuation >> createActionContinuation [
	"Answer a new action phase continuation."

	^ self actionPhaseContinuationClass snapshot: self states
]

{ #category : #private }
WARenderLoopContinuation >> createActionContinuationWithContext: aRenderContext [
	"Answer a new action phase continuation."

	^ self actionPhaseContinuationClass snapshot: self states renderContext: aRenderContext
]

{ #category : #private }
WARenderLoopContinuation >> createRenderContinuation [
	"Answer a new render phase continuation."

	^ (self application preferenceAt: #renderPhaseContinuationClass) value new
]

{ #category : #testing }
WARenderLoopContinuation >> isActionContinuation [
	^ self class isActionContinuation
]

{ #category : #testing }
WARenderLoopContinuation >> isRenderContinuation [
	^ self class isRenderContinuation
]

{ #category : #accessing }
WARenderLoopContinuation >> presenter [
	"Answer the root presenter instance for the current session."

	^ self session presenter
]

{ #category : #private }
WARenderLoopContinuation >> scriptGeneratorClass [

	^ (self application preferenceAt: #scriptGeneratorClass) value
]

{ #category : #updating }
WARenderLoopContinuation >> toPresenterSendRoot: anHtmlRoot [
	(WAVisiblePresenterGuide client:
		(WAUpdateRootVisitor root: anHtmlRoot))
		start: self presenter
]

{ #category : #updating }
WARenderLoopContinuation >> updateRoot: anHtmlRoot [
	| charSet |
	charSet := self application contentType charSet.
	charSet isNil ifFalse: [
		anHtmlRoot meta charset: charSet ].
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Seaside'.
	self application libraries 
		do: [ :each | each default updateRoot: anHtmlRoot ].
	self session updateRoot: anHtmlRoot
]

{ #category : #updating }
WARenderLoopContinuation >> updateStates: aSnapshot [
	super updateStates: aSnapshot.
	(WAAllPresenterGuide client:
		(WAUpdateStatesVisitor snapshot: aSnapshot))
		start: self presenter
]

{ #category : #updating }
WARenderLoopContinuation >> updateUrl: aUrl [
	super updateUrl: aUrl.
	(WAVisiblePresenterGuide client: (WAUpdateUrlVisitor url: aUrl))
		start: self presenter
]

{ #category : #private }
WARenderLoopContinuation >> withNotificationHandlerDo: aBlock [
	| currentHandler |
	currentHandler := WACurrentExceptionHandler value.
	^ currentHandler isNil
		ifTrue: [
			aBlock on: WARenderNotification do: [ :n | ] ]
		ifFalse: [
			"For platforms with ANSI exceptions we have to nest exception handlers
			
			with ANSI exceptions
			When signaling an exception from an exception handler block the look up of
			the new exception handler starts in the exception handler block.
			
			without ANSI exceptions
			When signaling an exception from an exception handler block the look up of
			the new exception handler starts where the original exception was signaled.
			
			platforms without ANSI exceptions: Pharo<4, Squeak, GS2.x
			platforms with ANSI exception: Pharo>=4, VAST, VW, GS3.x"
			[ currentHandler handleExceptionsDuring: aBlock ]
				on: WARenderNotification
				 do: [ :n | ] ]
		
]
