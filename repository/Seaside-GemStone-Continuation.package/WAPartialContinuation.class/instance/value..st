evaluating
value: anObject 

	| marker frameIndex |
	marker := self markerBlock value.
	marker isNil
		ifTrue: [ 
			marker := ((GsProcess _frameContentsAt: 2) at: 1).
			frameIndex := 2 ]
		ifFalse: [ frameIndex := self class findFrameIndexFor: marker ].
	^GsProcess 
		installPartialContinuation: partial 
		atLevel: frameIndex
		value: anObject