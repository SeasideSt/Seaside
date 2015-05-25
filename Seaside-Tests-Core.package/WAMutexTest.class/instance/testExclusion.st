tests
testExclusion
	| value semaphore1 semaphore2 semaphore3 semaphore4 |
	value := nil.
	semaphore1 := GRPlatform current semaphoreClass new.
	semaphore2 := GRPlatform current semaphoreClass new.
	semaphore3 := GRPlatform current semaphoreClass new.
	semaphore4 := GRPlatform current semaphoreClass new.
	process := 
	[ mutex critical: 
		[ semaphore1 signal.
		semaphore2 wait.
		value := 1 ] ] newProcess.
	process2 := 
	[ semaphore3 signal.
	mutex critical: 
		[ semaphore3 signal.
		semaphore4 wait.
		value := 2.
		semaphore3 signal ] ] newProcess.
	process resume.
	semaphore1 wait.
	process2 resume.
	semaphore3 wait.
	self assert: mutex owner == process.
	self assert: value isNil.
	semaphore2 signal.
	semaphore3 wait.
	self assert: mutex owner == process2.
	self assert: value = 1.
	semaphore4 signal.
	semaphore3 wait.
	self assert: mutex owner isNil.
	self assert: value = 2