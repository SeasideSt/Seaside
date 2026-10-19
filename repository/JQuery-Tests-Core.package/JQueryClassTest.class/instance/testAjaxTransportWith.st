tests
testAjaxTransportWith
	self
		assert: (self jQuery ajaxTransport: 'json' with: 'handler')
		equals: self function , '.ajaxTransport("json","handler")'