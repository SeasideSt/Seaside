tests
testDictionary
	self
		assert:
			((GRSmallDictionary2 new)
				at: 'foo' put: 1;
				at: 'bar' put: 2;
				at: 'zork' put: 3;
				yourself)
		gives: '{"foo": 1, "bar": 2, "zork": 3}'.
	self
		assert:
			((GRSmallDictionary2 new)
				at: '' put: 'empty';
				yourself)
		gives: '{"": "empty"}'.

	self
		assert:
			((Dictionary new)
				at: '1abc' put: 'not-an-id';
				yourself)
		gives: '{"1abc": "not-an-id"}'.
	self
		assert:
			((Dictionary new)
				at: 'abc1' put: 'totally sexy';
				yourself)
		gives: '{"abc1": "totally sexy"}'