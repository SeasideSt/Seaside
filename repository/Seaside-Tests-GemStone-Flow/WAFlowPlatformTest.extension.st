Extension { #name : #WAFlowPlatformTest }

{ #category : #'*seaside-tests-gemstone-flow' }
WAFlowPlatformTest >> expectedFailures [
	"GemStone fails this test, but the failure is not evident in the functionality 
	  of Seaside itself.
	
	 The test #testSuspendCallbackDoGemStone passes and is only slightly altered 
	  from #testSuspendCallbackDo."
	
	| failures |
	((System stoneVersionAt: 'gsVersion') beginsWith: '2.') ifFalse: [^#() ].
	failures := #( #testSuspendCallbackDo ).
	Smalltalk at: #TranscriptProxy ifPresent: [:cl |
		(cl perform: #proxyTranscript) ifNil: [ failures := failures, #( #testSuspendCallbackDoGemStone ) ] ].
	^failures
]

{ #category : #'*seaside-tests-gemstone-flow' }
WAFlowPlatformTest >> testSuspendCallbackDoGemStone [
	| continuation result |
	continuation := nil.
	self withCallbackContinuationDo: [ :cc | continuation := cc ] resultBlock: [ :r | Transcript cr; show: 'extra statement'. result := r ].
	self assert: continuation notNil.
	self evaluateCallbackContinuation: continuation with: 123.
	self assert: result = 123
]
