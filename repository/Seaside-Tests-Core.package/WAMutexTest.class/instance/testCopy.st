tests
testCopy
	| semaphore1 semaphore2 copy |
	semaphore1 := GRPlatform current semaphoreClass new.
	semaphore2 := GRPlatform current semaphoreClass new.
	process := [ mutex critical: 
		[ semaphore1 signal.
		semaphore2 wait ] ] newProcess.
	process resume.
	semaphore1 wait.
	copy := mutex copy.
	self deny: copy == mutex.
	self assert: copy species = mutex species.
	self assert: copy owner isNil.
	self assert: (copy critical: [ 1 ]) = 1