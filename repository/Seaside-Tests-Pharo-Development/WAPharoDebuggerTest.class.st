Class {
	#name : #WAPharoDebuggerTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Pharo-Development'
}

{ #category : #testing }
WAPharoDebuggerTest >> expectedFailures [
	"The Pharo debugger API is currently broken.
	The Squeak debugger API is not broken
	When it's fixed this test will pass again and we can add temps to the Pharo walkback again."
	Smalltalk at: #SystemVersion ifPresent: [ :systemVersion |
		| versionString |
		versionString := systemVersion current version.
		(versionString beginsWith: 'Pharo') ifTrue: [
			"only for Pharo < 8"
			systemVersion current major >= 8
				ifFalse: [ ^ #(testNamedTempAt) ] ].
		((versionString beginsWith: 'Squeak') and: [
			"for old Squeak, was fixed in 5.1"
			systemVersion current date < (Date year: 2016 month: 8 day: 23) or: [
				"Temporary fix for corrupted changes file"
				systemVersion current version = 'Squeak5.2' ] ]) ifTrue: [
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
		| tempNames |
		"fails on Sqeuak"
		self shouldnt: [ tempNames := each tempNames ] raise: Notification.
		1 to: tempNames size do: [ :i |
			"fails on Pharo"
			self shouldnt: [ each namedTempAt: i ] raise: Error ] ]
]
