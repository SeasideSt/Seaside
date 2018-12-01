Extension { #name : #GRGemStonePlatform }

{ #category : #'*seaside-gemstone-flow' }
GRGemStonePlatform >> callbackMarker [

	| level aFrame visitTaskMethod |
	visitTaskMethod := WATaskVisitor compiledMethodAt: #visitTask:.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(((aFrame at: 10) isKindOf: WACallback) or: [ (aFrame at: 1) == visitTaskMethod ])
				ifTrue: [ ^aFrame at: 1 ].
			level := level + 1 ].
	^nil
]

{ #category : #'*seaside-gemstone-flow' }
GRGemStonePlatform >> seasideSuspendFlowDo: aBlock [
	| marker |
	(marker := self callbackMarker) == nil
		ifTrue: [ ^WAGsInvalidCallbackContext signal: 'You can only #call: and #answer: from within a callback or a Task.' ].
	^aBlock value: (WAPartialContinuation to: marker offset: 0 markerBlock: [ self callbackMarker ])
]
