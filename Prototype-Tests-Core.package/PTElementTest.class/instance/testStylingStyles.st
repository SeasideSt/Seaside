tests
testStylingStyles
	self
		assert: (self element id: 'foo'; styleAt: 'width')
		equals: '$("foo").getStyle("width")'.
	self
		assert: (self element styleAt: 'height')
		equals: '$(this).getStyle("height")'.
	self
		assert: (self element id: 'foo'; styleAt: 'width' put: '100px')
		equals: '$("foo").setStyle({"width":"100px"})'.
	self
		assert: (self element styleAt: 'background-color' put: Color white)
		equals: '$(this).setStyle({"background-color":"#FFFFFF"})'