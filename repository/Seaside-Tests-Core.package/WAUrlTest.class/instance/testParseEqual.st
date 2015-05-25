testing-parsing
testParseEqual
	self equalExamples do: [ :each |
		self 
			assert: (WAUrl absolute: each first) = (WAUrl absolute: each second)
		 	description: each second resumable: true ]