Extension { #name : 'WAJsonStreamTest' }

{ #category : '*Seaside-Tests-Pharo-JSON-Core' }
WAJsonStreamTest >> testOrderedDictionary [
	self
		assert:
			((OrderedDictionary new)
				at: 'foo' put: 1;
				at: 'bar' put: 2;
				at: 'zork' put: 3;
				yourself)
		gives: '{"foo": 1, "bar": 2, "zork": 3}'.
	self
		assert:
			((OrderedDictionary new)
				at: '' put: 'empty';
				yourself)
		gives: '{"": "empty"}'.
	self should: [
		self
			assert:
				((OrderedDictionary new)
					at: 1 put: 'not-a-string';
					yourself)
			gives: '{1: "not-a-string"}' ]
		raise: Error
		withExceptionDo: [ :e | self assert: e messageText equals: 'Only Strings can be used as keys in JSON objects.' ].
	self
		assert:
			((OrderedDictionary new)
				at: '1abc' put: 'not-an-id';
				yourself)
		gives: '{"1abc": "not-an-id"}'.

	self
		assert:
			((OrderedDictionary new)
				at: 'abc1' put: 'totally sexy';
				yourself)
		gives: '{"abc1": "totally sexy"}'
]

{ #category : '*seaside-tests-pharo-json-core' }
WAJsonStreamTest >> testScaledDecimal [
	self assert: 123.4s1 gives: '123.4'
]
