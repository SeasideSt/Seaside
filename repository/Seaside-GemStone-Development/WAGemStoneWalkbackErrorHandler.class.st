"
Use this class as an exceptionHandler when you want the stack frame displayed on the web page, with the option to open a debugger in the gem.

You should only use this class when you are running the adaptor directly in GemTools
"
Class {
	#name : #WAGemStoneWalkbackErrorHandler,
	#superclass : #WAWalkbackErrorHandler,
	#category : 'Seaside-GemStone-Development-Core'
}

{ #category : #'exception handling' }
WAGemStoneWalkbackErrorHandler class >> exceptionSelector [
	^ super exceptionSelector, GRPlatform current gemstoneExceptionSelector
]

{ #category : #actions }
WAGemStoneWalkbackErrorHandler >> handleException: anException [
	^ self handleGemStoneException: anException
]

{ #category : #private }
WAGemStoneWalkbackErrorHandler >> open: anException [ 
	| answer |
	self requestContext request isXmlHttpRequest ifTrue: [ ^ super open: anException ].

	"If an error occurs trying to display the walkback component, we just use the super
	behaviour, which should be to open a debugger.."
	answer := true.
	[ self session isNil ifFalse: 
		[ answer := self session presenter call: (WAWalkback current exception: anException).
		"Exception handlers hold the request context because they are used in places where
		the dynamic variable is not present. Since this particular class depends on RenderLoop, 		however, it will be present and we need to update the stored value after doing a call."
		requestContext := WACurrentRequestContext value ] ] 
		on: Error
		do: [ :err |
			Transcript cr; show: 'Error creating WAWalkback: ', err description. 
			answer := false.
			self openDebuggerOn: anException ].
	answer ifTrue: [ self openDebuggerOn: anException ]
]

{ #category : #private }
WAGemStoneWalkbackErrorHandler >> openDebuggerOn: anException [

	^GRPlatform current openDebuggerOn: anException
]
