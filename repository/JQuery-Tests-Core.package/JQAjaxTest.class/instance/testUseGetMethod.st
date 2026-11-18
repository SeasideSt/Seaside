tests-options
testUseGetMethod
	self
		assert: self ajax useGet
		equals: self function, '.ajax({"method":"GET"})'