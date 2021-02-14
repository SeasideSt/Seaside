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
  | result |
  "The use of privateCallcc: is a workaround to be able to restore the process environment when restoring a partial continuation. It could be removed and inlined if the process environment is restored as part of the primitive that restores a partial continuation. See also GRGemStonePlatform>>seasideSuspendFlowDo:"
  result := self privateCallcc: aBlock.
  ^ result isProcessEnvironmentWrapper
    ifTrue: [ result restoreEnvironmentAndReturnValue ]
    ifFalse: [ result ]
]

{ #category : #private }
WAPartialContinuationAlternatMarkerTest >> isProcessEnvironmentWrapper [
  ^ true
]

{ #category : #private }
WAPartialContinuationAlternatMarkerTest >> markDiscardingResultOf: aBlock [
	[ aBlock value ] value
]

{ #category : #private }
WAPartialContinuationAlternatMarkerTest >> privateCallcc: aBlock [
  ^ WAPartialContinuation currentDo: aBlock markerBlock: [ self callbackMarker ]
]

{ #category : #testing }
WAPartialContinuationAlternatMarkerTest >> testSimple [
	self assert: (WAPartialContinuationAlternatMarker new mark: [ self callcc: [ :cc | cc value: true ] ]).
]
