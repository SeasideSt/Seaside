tests-options
testStatusCode
	self
		assert: (self ajax statusCode: 'handlers')
		equals: self function, '.ajax({"statusCode":"handlers"})'.
	self
		assert: (self ajaxSetup statusCode: 'handlers')
		equals: self function, '.ajaxSetup({"statusCode":"handlers"})'.