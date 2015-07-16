testing
testInitialCount
	| counter |
	counter := GRPlatform current newReducedConflictCounter.
	self assert: counter value = 0.
	counter increment.
	self assert: counter value = 1