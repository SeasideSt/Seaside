Extension { #name : #WAErrorHandler }

{ #category : #'*seaside-gemstone-environment' }
WAErrorHandler >> handleAlmostOutOfStack: anAlmostOutOfStack [
	^ self handleDefault: anAlmostOutOfStack
]

{ #category : #'*seaside-gemstone-environment' }
WAErrorHandler >> handleBreakpoint: aBreakpoint [
	^ self handleDefault: aBreakpoint
]

{ #category : #'*seaside-gemstone-environment' }
WAErrorHandler >> handleGemStoneException: anException [
	| grPlatform |
	(Error handles: anException)
		ifTrue: [ ^ self handleError: anException ].
	(Warning handles: anException)
		ifTrue: [ ^ self handleWarning: anException ].
	grPlatform := GRPlatform current.
	(grPlatform handlesHaltException: anException)
		ifTrue: [ ^ self handleHalt: anException ].
	(grPlatform handlesAlmostOutOfStackException: anException)
		ifTrue: [ ^ self handleAlmostOutOfStack: anException ].
	(grPlatform handlesBreakpointException: anException)
		ifTrue: [ ^ self handleBreakpoint: anException ].
	^super handleGemStoneException: anException
]

{ #category : #'*seaside-gemstone-environment' }
WAErrorHandler >> handleHalt: aHalt [
	^ self handleDefault: aHalt
]

{ #category : #'*seaside-gemstone-environment' }
WAErrorHandler >> remoteBreakpointMethod [
	"Special marker method ... causes OTRemoteDebugger to be used for debugging"
	
	^self
]

{ #category : #'*seaside-gemstone-environment' }
WAErrorHandler >> saveExceptionContinuation: anException [

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
]
