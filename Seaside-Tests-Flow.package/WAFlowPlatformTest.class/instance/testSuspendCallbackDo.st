tests
testSuspendCallbackDo
	| continuation result |
	continuation := nil.
	self withCallbackContinuationDo: [ :cc | continuation := cc ] resultBlock: [ :r | result := r ].
	self assert: continuation notNil.
	self evaluateCallbackContinuation: continuation with: 123.
	self assert: result = 123