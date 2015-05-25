tests
testGet
	self
		assert: (self jQuery get)
		equals: self function , '.get("/")'