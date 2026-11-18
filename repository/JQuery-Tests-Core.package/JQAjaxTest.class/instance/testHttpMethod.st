tests-options
testHttpMethod
	self
		assert: (self ajax httpMethod: 'post')
		equals: self function, '.ajax({"method":"POST"})'.
	self
		assert: (self ajaxSetup httpMethod: 'post')
		equals: self function, '.ajaxSetup({"method":"POST"})'.