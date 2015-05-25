tests-rendering
testRenderingChildren
	root onChildren: [ Array with: child1 with: child2 ].
	child1 onRender: [ :html | html text: '1' ].
	child2 onRender: [ :html | html text: '2' ].
	self assertRenders: '12'.
	
	root onRender: [ :html | html text: 'a'; render: child1; text: 'b'; render: child2; text: 'c' ].
	self assertRenders: 'a1b2c'.
	
	root onChildren: [ Array with: child2 with: child1 ].
	self assertRenders: 'a1b2c'.

	root onRender: [ :html | html text: 'a'; render: child2; text: 'b'; render: child1; text: 'c' ].
	self assertRenders: 'a2b1c'