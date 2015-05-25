tests-options
testProcessData
	self
		assert: (self ajax processData: false)
		equals: self function , '.ajax({"processData":false})'