tests
testSelfTerminate
	| value |
	value := nil.
	process := 
	[ value := mutex critical: 
		[ mutex terminateOwner.
        1 ] ] newProcess.
	process 
		priority: Processor activeProcess priority + 1;
		resume.
	Processor yield.  "<--- required for GemStone prior to 3.7"
	self assert: mutex owner isNil.
	self assert: value isNil.
	self assert: (GRPlatform current isProcessTerminated: process)