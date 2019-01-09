*seaside-tests-gemstone-flow
testSuspendCallbackDoGemStone
	| continuation result |
	continuation := nil.
	self withCallbackContinuationDo: [ :cc | continuation := cc ] resultBlock: [ :r | Transcript cr; show: 'extra statement'. result := r ].
	self assert: continuation notNil.
	self evaluateCallbackContinuation: continuation with: 123.
	self assert: result = 123