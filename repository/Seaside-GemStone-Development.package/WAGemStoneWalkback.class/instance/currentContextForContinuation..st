private
currentContextForContinuation: aContinuation 
	| initial context |
	initial := context := GsContext fromContinuation: aContinuation atLevel: 1.
   "Attempt to trim stack to provide a more useful short stack report"
	[context ~~ nil _and: [context method selector ~~ #signal:args:signalDictionary:]]
		whileTrue: [context := context sender].
	context == nil
		ifTrue: [
			context := initial.
			[context ~~ nil _and: [context method selector ~~ #_gsReturnTos]]
				whileTrue: [context := context sender].
		].
        "Stack trimming was unsuccessful, return the whole stack"
	context == nil ifTrue: [ ^initial sender ].
	^context sender