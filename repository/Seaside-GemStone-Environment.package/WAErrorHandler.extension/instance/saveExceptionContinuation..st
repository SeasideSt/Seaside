*seaside-gemstone-environment
saveExceptionContinuation: anException

	| continuation action |
	 GRPlatform current canDebugInteractively
		ifTrue: [ anException pass ].
	GRPlatform current logError: anException description title: 'Continuation saved to object log'.
	action := [:cont | continuation := cont. #create ] callCC.
	action == #create
		ifTrue: [ | logEntry|
			WACurrentRequestContext value forDebugging: true.
			logEntry := WAObjectLogEntry 
				error: anException description 
				request: WACurrentRequestContext value request
				continuation: continuation.
			"the continuation is not resumable"
			logEntry resumeContinuation.
			logEntry addToLog.
			^self].
	action == #debug
		ifTrue: [ | meth |
			meth := self class lookupSelector: #remoteBreakpointMethod.
			meth setBreakAtStepPoint: 1.
			self remoteBreakpointMethod ].