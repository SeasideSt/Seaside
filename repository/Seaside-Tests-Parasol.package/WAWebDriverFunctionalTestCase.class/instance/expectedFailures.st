running
expectedFailures
	| todo |
	todo := #(testExceptionFunctionalTest testExpiryFunctionalTest testFilterFunctionalTest testFlowErrorFunctionalTest).
	^ (GRPlatform current name = 'GRGemStonePlatform')
		ifTrue: [ #(testContextFunctionalTest), todo "requires https://github.com/GsDevKit/Grease/pull/17 to be merged" ]
		ifFalse:[ todo ]