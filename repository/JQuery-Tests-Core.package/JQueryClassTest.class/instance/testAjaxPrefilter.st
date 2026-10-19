tests
testAjaxPrefilter
	self
		assert: (self jQuery ajaxPrefilter: 'json')
		equals: self function , '.ajaxPrefilter("json")'