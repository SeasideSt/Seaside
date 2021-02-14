Class {
	#name : #WAFlushingRenderPhaseContinuation,
	#superclass : #WARenderPhaseContinuation,
	#category : 'Seaside-RenderLoop'
}

{ #category : #processing }
WAFlushingRenderPhaseContinuation >> documentOpened: aResponse [
	aResponse flush
]
