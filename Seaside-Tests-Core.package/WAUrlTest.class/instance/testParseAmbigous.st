testing-parsing
testParseAmbigous
	self ambigousExamples do: [ :each | 
		self 
			assert: (WAUrl absolute: each first) greaseString = each last
			description: each last
			resumable: true ]