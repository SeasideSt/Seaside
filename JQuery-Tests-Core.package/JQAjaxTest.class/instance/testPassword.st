tests-options
testPassword
	self
		assert: (self ajax password: 'topsecret')
		equals: self function , '.ajax({"password":"topsecret"})'