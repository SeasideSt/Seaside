tests-rendering
testRenderingDecoration
	root onRender: [ :html | html text: 'r' ].
	root addDecoration: decoration1.
	
	decoration1 onRender: [ :html :cc | html text: '1'. cc value ].
	self assertRenders: '1r'.
	
	decoration1 onRender: [ :html :cc | cc value. html text: '1' ].
	self assertRenders: 'r1'.
	
	decoration1 onRender: [ :html :cc | html text: '1' ].
	self assertRenders: '1'