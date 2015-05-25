tests-options
testAsync
	self
		assert: (self ajax async: true)
		equals: self function , '.ajax({"async":true})'