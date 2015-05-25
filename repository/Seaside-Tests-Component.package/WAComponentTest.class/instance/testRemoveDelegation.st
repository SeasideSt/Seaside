tests
testRemoveDelegation
	self assert: root delegations isEmpty.
	root show: child1.
	root show: child2.
	self assert: root delegations size = 2.
	root removeDelegation.
	self assert: root delegations size = 1.
	root removeDelegation.
	self assert: root delegations isEmpty.
	root removeDelegation.
	self assert: root delegations isEmpty