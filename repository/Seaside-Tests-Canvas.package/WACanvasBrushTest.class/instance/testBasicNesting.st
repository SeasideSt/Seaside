tests
testBasicNesting
	self assert: [ :html | html div ] gives: '<div></div>'.
	self assert: [ :html | html div: 1 ] gives: '<div>1</div>'.
	self assert: [ :html | html div: 'foo' ] gives: '<div>foo</div>'