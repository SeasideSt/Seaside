tests-custom
testCustomDictionary
	printer := [ :renderer | 
		renderer render: (GRSmallDictionary2 new
			at: 'foo' put: 'bar';
			at: 'zork' put: (GRSmallDictionary2 new
				at: 'foo' put: 'bar';
				yourself);
			yourself) ].
	self assert: self equals: '{"foo": "bar", "zork": {"foo": "bar"}}'