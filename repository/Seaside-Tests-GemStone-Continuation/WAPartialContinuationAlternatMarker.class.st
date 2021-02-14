Class {
	#name : #WAPartialContinuationAlternatMarker,
	#superclass : #Object,
	#category : 'Seaside-Tests-GemStone-Continuation'
}

{ #category : #private }
WAPartialContinuationAlternatMarker >> mark: aBlock [
	^ aBlock value
]
