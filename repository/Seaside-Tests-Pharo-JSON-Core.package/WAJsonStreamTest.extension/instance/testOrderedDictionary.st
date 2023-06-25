*Seaside-Tests-Pharo-JSON-Core
testOrderedDictionary
	self
		assert:
			((OrderedDictionary new)
				at: 'foo' put: 1;
				at: 'bar' put: 2;
				at: 'zork' put: 3;
				yourself)
		equals: '{"foo": 1, "bar": 2, "zork": 3}'.
	self
		assert:
			((OrderedDictionary new)
				at: '' put: 'empty';
				yourself)
		equals: '{"": "empty"}'.
	self should: [
		self
			assert:
				((OrderedDictionary new)
					at: 1 put: 'not-a-string';
					yourself)
			equals: '{1: "not-a-string"}' ]
		raise: Error
		whoseDescriptionIncludes: 'Only Strings can be used as keys in JSON objects.'
		description: 'Throw an error when serializing dictionaries with non-String keys'.
	self
		assert:
			((OrderedDictionary new)
				at: '1abc' put: 'not-an-id';
				yourself)
		equals: '{"1abc": "not-an-id"}'.

	self
		assert:
			((OrderedDictionary new)
				at: 'abc1' put: 'totally sexy';
				yourself)
		equals: '{"abc1": "totally sexy"}'