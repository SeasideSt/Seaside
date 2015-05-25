tests
testGetScript
	self
		assert: (self jQuery getScript)
		equals: self function , '.getScript("/")'