tests
testChildComponentShouldNotBeSelfError
	child1 onRender: [ :html | html text: '1' ].
	child2 onRender: [ :html | html text: '2' ].
	root onChildren: [ Array with: child1 with: child2 ].

	"render so that we ensure component iterates over it's children"	
	self assertRenders: '12'.
	
	root onChildren: [ Array with: child1 with: root ].

	self
		should: [ self assertRenders: 'dont care only interested in the raised exception' ] 
		raise: WAChildComponentShouldNotBeSelfError
		description: 'Testing WAPresenter  >> #childrenDo: with #children returning an array including self'