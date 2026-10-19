tests
testAjaxTransport
	self
		assert: (self jQuery ajaxTransport: 'json')
		equals: self function , '.ajaxTransport("json")'