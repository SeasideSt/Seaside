tests
testDelegations
	self assert: root delegations isEmpty.
	root show: child1.
	self assert: root delegations size = 1.
	root addDecoration: decoration1.
	self assert: root delegations size = 1