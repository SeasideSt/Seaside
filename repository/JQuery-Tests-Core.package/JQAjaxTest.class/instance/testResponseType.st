tests-options
testResponseType
	self
		assert: (self ajax responseType: 'json')
		equals: self function, '.ajax({"responseType":"json"})'