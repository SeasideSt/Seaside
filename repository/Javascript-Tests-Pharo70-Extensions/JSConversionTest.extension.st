Extension { #name : #JSConversionTest }

{ #category : #'*Javascript-Tests-Pharo70-Extensions' }
JSConversionTest >> testOrderedDictionary [
	self 
		assert: (OrderedDictionary new
				at: 'foo'
					put: 1;
				at: 'bar'
					put: 2;
				at: 'zork'
					put: 3;
				yourself)
		equals: '{"foo":1,"bar":2,"zork":3}'.
	self 
		assert: (OrderedDictionary new
				at: '' put: 'empty';
				at: 1  put: 'not-a-string';
				yourself)
		equals: '{"":"empty","1":"not-a-string"}'.
	self 
		assert: (OrderedDictionary new
				at: '1abc' put: 'not-an-id';
				at: '2abc' put: 'not-an-id-either';
				yourself)
		equals: '{"1abc":"not-an-id","2abc":"not-an-id-either"}'.
	self 
		assert: (OrderedDictionary new
				at: 'abc1'
					put: 'totally sexy';
				yourself)
		equals: '{"abc1":"totally sexy"}'
]
