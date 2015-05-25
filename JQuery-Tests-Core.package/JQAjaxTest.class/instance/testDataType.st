tests-options
testDataType
	self
		assert: (self ajax dataType: 'xml')
		equals: self function , '.ajax({"dataType":"xml"})'