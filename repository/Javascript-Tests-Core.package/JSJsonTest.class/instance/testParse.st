tests
testParse
	self 
		assert: (self json parse: '[1,2]')
		equals: 'JSON.parse("[1,2]")'.
	self 
		assert: (self json parse: '[1,2]' reviver: 'return null')
		equals: 'JSON.parse("[1,2]",function(){return null})'