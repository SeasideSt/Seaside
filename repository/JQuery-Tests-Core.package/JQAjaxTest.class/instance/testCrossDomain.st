tests-options
testCrossDomain
	self
		assert: (self ajax crossDomain: true)
		equals: self function, '.ajax({"crossDomain":true})'