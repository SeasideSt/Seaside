tests
testSelfTerminate
	| value semaphore |
	value := nil.
	semaphore := GRPlatform current semaphoreClass new.
	process := 
	[ value := mutex critical: 
		[ semaphore signal.
		mutex terminateOwner.
		1 ] ] newProcess.
	process resume.
	semaphore wait.
	self assert: mutex owner isNil.
	self assert: value isNil.
	self assert: (GRPlatform current isProcessTerminated: process)