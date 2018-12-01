Class {
	#name : #WAPharoDebuggerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Pharo-Development'
}

{ #category : #private }
WAPharoDebuggerTest >> expectedFailures [
	"The Pharo debugger API is currently broken.
	The Squeak debugger API is not broken
	When it's fixed this test will pass again and we can add temps to the Pharo walkback again."
	Smalltalk at: #SystemVersion ifPresent: [ :systemVersion |
		| versionString |
		versionString := systemVersion current version.
		((versionString beginsWith: 'Pharo') or: [ versionString includesSubString: 'Pharo' ]) ifTrue: [
			"only for Pharo"
			^ #(testNamedTempAt) ] ].
	^ #()
]

{ #category : #private }
WAPharoDebuggerTest >> signalInterestingError [
	GRPlatform current semaphoreClass forMutualExclusion critical: [
		WAError signal: 'foo' ]
]

{ #category : #tests }
WAPharoDebuggerTest >> testNamedTempAt [
	"This is a test for the Pharo debugger API
	http://code.google.com/p/seaside/issues/detail?id=689"
	| frames |
	frames := OrderedCollection new.
	[ self signalInterestingError ]
		on: WAError
		do: [ :error |
			| context |
			context := error signalerContext.
			[ context isNil ] whileFalse: [
				frames add: context.
				context := context sender ] ].
	frames do: [ :each |
		1 to: each tempNames size do: [ :i |
			self shouldnt: [ each namedTempAt: i ] raise: Error ] ]
]
