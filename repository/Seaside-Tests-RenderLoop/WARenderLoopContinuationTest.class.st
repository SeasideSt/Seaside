Class {
	#name : #WARenderLoopContinuationTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-RenderLoop'
}

{ #category : #tests }
WARenderLoopContinuationTest >> testExceptionHandlerNesting [
	| continuation handler |
	"https://github.com/SeasideSt/googlecode-seaside-export/issues/636"
	continuation := WARenderLoopContinuation new.
	handler := WASignalingErrorHandler new.
	self
		shouldnt:  [
				continuation withNotificationHandlerDo: [
					handler handleExceptionsDuring: [
						WAError signal: 'Testing 1, 2, 3' ] ] ]
		raise: WARenderNotification
]
