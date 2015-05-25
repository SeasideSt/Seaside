tests
testAddToEvent
	self 
		assert: [ :html | html div onClick: self mock ]
		renders: '<div onclick="mock"></div>'.
	self 
		assert: [ :html | html div onMouseOut: self mock ]
		renders: '<div onmouseout="mock"></div>'.
	self 
		assert: [ :html | html div onKeyUp: self mock ]
		renders: '<div onkeyup="mock"></div>'