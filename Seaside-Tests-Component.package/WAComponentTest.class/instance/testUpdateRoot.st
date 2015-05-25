tests
testUpdateRoot
	| htmlRoot guide |
	htmlRoot := WAHtmlRoot new.

	root onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'root' ].
	child1 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'child1' ].
	child2 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'child2' ].
	child3 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'child3' ].
	decoration1 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'decoration1' ].
	decoration2 onUpdateRoot: [ :each |
		self assert: each = htmlRoot.
		self log: 'decoration2' ].

	guide := WAVisiblePresenterGuide client: (WAUpdateRootVisitor root: htmlRoot).

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
	self assertLog: #('decoration2' 'decoration1' 'root' 'child1' 'child3')