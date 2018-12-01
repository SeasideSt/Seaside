Class {
	#name : #WAPartialContinuationAlternatMarkerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-GemStone-Continuation'
}

{ #category : #private }
WAPartialContinuationAlternatMarkerTest >> callbackMarker [

	| level aFrame markDiscardingMeth |
	markDiscardingMeth := self class compiledMethodAt: #markDiscardingResultOf:.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(((aFrame at: 10) class == WAPartialContinuationAlternatMarker) or: [ (aFrame at: 1) == markDiscardingMeth ])
				ifTrue: [ ^aFrame at: 1 ].
			level := level + 1 ].
	^nil
]

{ #category : #private }
WAPartialContinuationAlternatMarkerTest >> callcc: aBlock [
	^WAPartialContinuation 
		currentDo: aBlock 
		markerBlock: [ self callbackMarker ]
]

{ #category : #private }
WAPartialContinuationAlternatMarkerTest >> markDiscardingResultOf: aBlock [
	[ aBlock value ] value
]

{ #category : #testing }
WAPartialContinuationAlternatMarkerTest >> testSimple [
	self assert: (WAPartialContinuationAlternatMarker new mark: [ self callcc: [ :cc | cc value: true ] ]).
]
