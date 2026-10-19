tests
testAjaxPrefilterWith
	self
		assert: (self jQuery ajaxPrefilter: 'json' with: 'handler')
		equals: self function , '.ajaxPrefilter("json","handler")'