tests-options
testJsonData
	self
		assert: (self ajax jsonData: '{"foo":1}')
		equals: self function, '.ajax({"contentType":"application/json; charset=UTF-8","processData":false,"dataType":"json","data":"{\"foo\":1}"})'