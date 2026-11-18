*jquery-tests-json
testExpectJson
	self
		assert: (self ajax expectJson)
		equals: self function, '.ajax({"dataType":"json"})'