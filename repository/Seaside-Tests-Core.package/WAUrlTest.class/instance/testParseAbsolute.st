testing-parsing
testParseAbsolute
	self absoluteExamples do: [ :each | 
		self 
			assert: (WAUrl absolute: each) greaseString = each
			description: each
			resumable: true ]