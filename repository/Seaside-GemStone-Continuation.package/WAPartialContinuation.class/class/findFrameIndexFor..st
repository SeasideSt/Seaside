private
findFrameIndexFor: aCompiledMethod
	"Return the deepest stack level for aCompiledMethod, counting from top of stack"
	
	| level markLevel aFrame |
	markLevel := nil.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(aFrame at: 1) == aCompiledMethod 
				ifTrue: [ ^ level + 0].
			level := level + 1].
	^nil