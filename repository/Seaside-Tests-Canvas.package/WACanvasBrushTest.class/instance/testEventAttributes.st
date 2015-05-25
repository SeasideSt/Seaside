tests-attributes
testEventAttributes
	self
		assert: [ :html | html div onBlur: 1; onBlur: 2 ]
		gives: '<div onblur="1;2"></div>'.
	self
		assert: [ :html | html div onChange: 1; onChange: 2 ]
		gives: '<div onchange="1;2"></div>'.
	self
		assert: [ :html | html div onClick: 1; onClick: 2 ]
		gives: '<div onclick="1;2"></div>'.
	self
		assert: [ :html | html div onDoubleClick: 1; onDoubleClick: 2 ]
		gives: '<div ondblclick="1;2"></div>'