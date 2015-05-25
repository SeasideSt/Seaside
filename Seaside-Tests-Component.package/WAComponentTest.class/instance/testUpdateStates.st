tests
testUpdateStates
	| snapshot guide |
	snapshot := WASnapshot new.

	root onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'root' ].
	child1 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'child1' ].
	child2 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'child2' ].
	child3 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'child3' ].
	decoration1 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'decoration1' ].
	decoration2 onUpdateStates: [ :each |
		self assert: each = snapshot.
		self log: 'decoration2' ].

	guide := WAAllPresenterGuide client: (WAUpdateStatesVisitor snapshot: snapshot).

	" single root component "
	guide start: root.
	self assertLog: #('root').

	" add two children "
	root onChildren: [ Array with: child1 with: child2 ].
	guide start: root.
	self assertLog: #('root' 'child1' 'child2').

	" add two decorations "
	root addDecoration: decoration1; addDecoration: decoration2.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child2').
	
	" delegate to another component "
	child2 show: child3.
	guide start: root.
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child3' 'child2')