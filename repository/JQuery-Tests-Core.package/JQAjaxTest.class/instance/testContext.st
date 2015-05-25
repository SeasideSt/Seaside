tests-options
testContext
	self
		assert: (self ajax context: self jQuery this)
		equals: self function , '.ajax({"context":', self function , '(this)})'