tests
testActiveComponent

	" single root component "
	self assert: root activeComponent = root.

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2.

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child2.
	
	" delegate to another component "
	child2 show: child3.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child3.
	self assert: child3 activeComponent = child3.
	
	" delegate to yet another component "
	child3 show: child4.
	self assert: root activeComponent = root.
	self assert: child1 activeComponent = child1.
	self assert: child2 activeComponent = child4.
	self assert: child3 activeComponent = child4.
	self assert: child4 activeComponent = child4
	