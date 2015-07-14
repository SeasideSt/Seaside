private
callbackMarker

	| level aFrame markDiscardingMeth |
	markDiscardingMeth := self class compiledMethodAt: #markDiscardingResultOf:.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(((aFrame at: 10) class == WAPartialContinuationAlternatMarker) or: [ (aFrame at: 1) == markDiscardingMeth ])
				ifTrue: [ ^aFrame at: 1 ].
			level := level + 1 ].
	^nil