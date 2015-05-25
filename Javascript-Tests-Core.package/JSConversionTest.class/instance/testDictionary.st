tests
testDictionary
	self 
		assert: (GRSmallDictionary new
				at: 'foo'
					put: 1;
				at: 'bar'
					put: 2;
				at: 'zork'
					put: 3;
				yourself)
		equals: '{"foo":1,"bar":2,"zork":3}'.
	self 
		assert: (GRSmallDictionary new
				at: ''
					put: 'empty';
				yourself)
		equals: '{"":"empty"}'.
	self 
		assert: (Dictionary new
				at: 1
					put: 'not-a-string';
				yourself)
		equals: '{"1":"not-a-string"}'.
	self 
		assert: (Dictionary new
				at: '1abc'
					put: 'not-an-id';
				yourself)
		equals: '{"1abc":"not-an-id"}'.
	self 
		assert: (Dictionary new
				at: 'abc1'
					put: 'totally sexy';
				yourself)
		equals: '{"abc1":"totally sexy"}'