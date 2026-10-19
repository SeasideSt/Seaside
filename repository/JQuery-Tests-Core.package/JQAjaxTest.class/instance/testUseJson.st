tests-options
testUseJson
	self
		assert: self ajax useJson
		equals: self function, '.ajax({"contentType":"application/json; charset=UTF-8","processData":false,"dataType":"json"})'