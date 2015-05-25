tests-options
testTimeout
	self
		assert: (self ajax timeout: 1200)
		equals: self function , '.ajax({"timeout":1200})'