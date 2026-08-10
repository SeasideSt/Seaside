tests-options
testStatusCode
	self
		assert: (self ajax statusCode: 'handlers')
		equals: self function, '.ajax({"statusCode":"handlers"})'