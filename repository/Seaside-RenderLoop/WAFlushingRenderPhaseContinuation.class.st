Class {
	#name : #WAFlushingRenderPhaseContinuation,
	#superclass : #WARenderPhaseContinuation,
	#category : 'Seaside-RenderLoop-Continuations'
}

{ #category : #processing }
WAFlushingRenderPhaseContinuation >> documentOpened: aResponse [
	aResponse flush
]
