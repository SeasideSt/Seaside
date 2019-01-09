private
callbackMarker

	| level aFrame markMeth markDiscardingMeth |
	markMeth := self class compiledMethodAt: #mark:.
	markDiscardingMeth := self class compiledMethodAt: #markDiscardingResultOf:.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(((aFrame at: 1) == markMeth) or: [ (aFrame at: 1) == markDiscardingMeth ])
				ifTrue: [ ^aFrame at: 1 ].
			level := level + 1 ].
	^nil