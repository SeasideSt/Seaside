testing
testInitialCount
	| counter |
	self workAroundPharo3Bug.
	
	counter := GRPlatform current newReducedConflictCounter.
	self assert: counter value = 0.
	counter increment.
	self assert: counter value = 1