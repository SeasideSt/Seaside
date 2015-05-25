tests
testCanBeRoot
	self deny: RRComponent canBeRoot.
	self assert: RRTestComponent canBeRoot