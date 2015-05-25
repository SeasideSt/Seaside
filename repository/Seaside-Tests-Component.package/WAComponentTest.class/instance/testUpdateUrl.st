tests
testUpdateUrl
	| url guide |
	url := WAUrl new.

	root onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'root' ].
	child1 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'child1' ].
	child2 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'child2' ].
	child3 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'child3' ].
	decoration1 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'decoration1' ].
	decoration2 onUpdateUrl: [ :each |
		self assert: each = url.
		self log: 'decoration2' ].

	guide := WAVisiblePresenterGuide client: (WAUpdateUrlVisitor url: url).

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