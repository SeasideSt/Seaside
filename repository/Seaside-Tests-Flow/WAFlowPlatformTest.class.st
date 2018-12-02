Class {
	#name : #WAFlowPlatformTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Flow-Unit'
}

{ #category : #private }
WAFlowPlatformTest >> evaluateCallbackContinuation: aContinuation with: anObject [
	| callback |
	callback := WAActionCallback new.
	callback block: [ aContinuation value: anObject ].
	[ callback evaluateWithArgument: nil ]
		on: WARenderNotification do: [ :n | ]
]

{ #category : #tests }
WAFlowPlatformTest >> testSuspendCallbackDo [
	| continuation result |
	continuation := nil.
	self withCallbackContinuationDo: [ :cc | continuation := cc ] resultBlock: [ :r | result := r ].
	self assert: continuation notNil.
	self evaluateCallbackContinuation: continuation with: 123.
	self assert: result = 123
]

{ #category : #private }
WAFlowPlatformTest >> withCallbackContinuationDo: ccBlock resultBlock: resultBlock [ 
	| callback |
	callback := WAActionCallback new.
	callback block: [ resultBlock value: (GRPlatform current seasideSuspendFlowDo: ccBlock) ].
	[ callback evaluateWithArgument: nil ] 
		on: WARenderNotification
		do: [ :n |  ]
]
