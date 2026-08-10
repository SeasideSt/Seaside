tests-options
testMethodAlias
	self
		assert: (self ajax method: 'post')
		equals: self function, '.ajax({"method":"POST"})'