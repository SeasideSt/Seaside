*seaside-tests-gemstone-flow
expectedFailures
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