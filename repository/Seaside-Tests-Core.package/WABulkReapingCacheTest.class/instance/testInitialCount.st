testing
testInitialCount

	| counter |	
	counter := GRPlatform current newReducedConflictCounter.
	self assert: counter value equals: 0.
	counter increment.
	self assert: counter value equals: 1