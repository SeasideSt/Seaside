tests-rendering
testRenderingDelegation
	root onRender: [ :html | html text: 'r' ].
	child1 onRender: [ :html | html text: '1' ].
	child2 onRender: [ :html | html text: '2' ].
	child3 onRender: [ :html | html text: '3' ].
	
	root show: child1.
	self assertRenders: '1'.
	
	child1 show: child2.
	self assertRenders: '2'.
	
	child2 answer.
	self assertRenders: '1'.
	
	root show: child3.
	self assertRenders: '3'.
	
	root home.
	self assertRenders: 'r'
	
	
	