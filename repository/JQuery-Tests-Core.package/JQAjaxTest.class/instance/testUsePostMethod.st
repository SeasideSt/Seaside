tests-options
testUsePostMethod
	self
		assert: self ajax usePost
		equals: self function, '.ajax({"method":"POST"})'