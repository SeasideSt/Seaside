testing-parsing
testParseRelative
	self relativeExamples do: [ :each | 
		self 
			assert: (WAUrl 
				absolute: each first
				relative: each second) greaseString = each last
			description: each last
			resumable: true ]