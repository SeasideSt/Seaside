tests-attributes
testCoreAttributesStyle
	self
		assert: [ :html | html div style: 'left: 0' ]
		gives: '<div style="left: 0"></div>'.
	self
		assert: [ :html | html div style: 'left: 0'; style: 'top: 2' ]
		gives: '<div style="left: 0;top: 2"></div>'