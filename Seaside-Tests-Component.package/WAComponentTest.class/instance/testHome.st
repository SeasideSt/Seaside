tests
testHome
	root show: child1.
	child1 show: child2.
	self assert: root activeComponent = child2.
	self assert: child1 activeComponent = child2.
	
	root home.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child2.
	self assert: child2 activeComponent = child2.
	
	child1 home.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2.
	
	child2 home.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2