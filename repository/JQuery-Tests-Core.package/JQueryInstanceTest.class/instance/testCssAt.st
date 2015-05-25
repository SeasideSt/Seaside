tests-css
testCssAt
	self
		assert: ((self jQuery: '#foo') cssAt: 'border')
		equals: self function , '("#foo").css("border")'