running
expectedFailures
	| todo |
	todo := #(testExceptionFunctionalTest testExpiryFunctionalTest testFilterFunctionalTest testFlowErrorFunctionalTest).
	^ (GRPlatform current class == (Smalltalk at: #GRGemStonePlatform ifAbsent:[ nil ]))
		ifTrue: [ #(testContextFunctionalTest), todo "requires https://github.com/GsDevKit/Grease/pull/17 to be merged" ]
		ifFalse:[ todo ]