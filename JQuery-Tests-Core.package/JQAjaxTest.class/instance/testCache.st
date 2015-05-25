tests-options
testCache
	self
		assert: (self ajax cache: false)
		equals: self function , '.ajax({"cache":false})'