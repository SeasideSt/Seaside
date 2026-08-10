tests-options
testHeaders
	self
		assert: (self ajax headers: 'Accept: application/json')
		equals: self function, '.ajax({"headers":"Accept: application/json"})'