testing-parsing
testParseInvalid
	self invalidExamples do: [ :each | 
		self 
			should: [ WAUrl absolute: each ]
			raise: WAInvalidUrlSyntaxError ]