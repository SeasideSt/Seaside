tests-options
testContentType
	self
		assert: (self ajax contentType: 'text/html')
		equals: self function , '.ajax({"contentType":"text/html"})'