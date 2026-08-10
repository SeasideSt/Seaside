*jquery-tests-json
testAcceptJson
	self
		assert: (self ajax acceptJson)
		equals: self function, '.ajax({"contentType":"application/json","dataType":"json"})'