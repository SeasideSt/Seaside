tests-options
testJsonpCallback
	self
		assert: (self ajax jsonpCallback: 1)
		equals: self function , '.ajax({"jsonpCallback":function(){1}})'