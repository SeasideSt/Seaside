tests
testGetJson
	self
		assert: (self jQuery getJson)
		equals: self function , '.getJSON("/")'