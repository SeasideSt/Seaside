"
I am a render phase continuation that only renders a fragment of a web page, without a head or body.
"
Class {
	#name : 'WAFragmentRenderPhaseContinuation',
	#superclass : 'WARenderPhaseContinuation',
	#category : 'Seaside-WebComponents-Core',
	#package : 'Seaside-WebComponents-Core'
}

{ #category : 'private' }
WAFragmentRenderPhaseContinuation >> createHtmlRootWithContext: aRenderContext [
	^ WANilHtmlRoot new
]

{ #category : 'updating' }
WAFragmentRenderPhaseContinuation >> toPresenterSendRoot: anHtmlRoot [
	"intentionally empty"
]

{ #category : 'updating' }
WAFragmentRenderPhaseContinuation >> updateRoot: anHtmlRoot [
	"intentionally empty"
]
