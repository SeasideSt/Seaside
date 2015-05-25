tests
testTerminate
	| value semaphore1 semaphore2 semaphore3 |
	value := nil.
	semaphore1 := GRPlatform current semaphoreClass new.
	semaphore2 := GRPlatform current semaphoreClass new.
	semaphore3 := GRPlatform current semaphoreClass new.
	process := 
	[ value := [ mutex critical: 
		[ semaphore1 signal.
		semaphore2 wait.
		1 ] ] ensure: [ semaphore3 signal ] ] newProcess.
	process resume.
	semaphore1 wait.
	self assert: mutex owner == process.
	mutex terminateOwner.
	semaphore3 wait.
	self assert: mutex owner isNil.
	self assert: value isNil.
	self assert: (GRPlatform current isProcessTerminated: process)