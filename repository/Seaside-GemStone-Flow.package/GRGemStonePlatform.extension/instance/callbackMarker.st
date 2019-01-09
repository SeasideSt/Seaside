*seaside-gemstone-flow
callbackMarker

	| level aFrame visitTaskMethod |
	visitTaskMethod := WATaskVisitor compiledMethodAt: #visitTask:.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(((aFrame at: 10) isKindOf: WACallback) or: [ (aFrame at: 1) == visitTaskMethod ])
				ifTrue: [ ^aFrame at: 1 ].
			level := level + 1 ].
	^nil