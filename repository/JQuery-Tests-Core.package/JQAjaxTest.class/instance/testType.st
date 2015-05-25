tests-options
testType
	self
		assert: (self ajax type: 'post')
		equals: self function , '.ajax({"type":"POST"})'