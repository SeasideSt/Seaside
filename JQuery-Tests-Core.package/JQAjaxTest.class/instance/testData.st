tests-options
testData
	self
		assert: (self ajax data: 'foo')
		equals: self function , '.ajax({"data":"foo"})'