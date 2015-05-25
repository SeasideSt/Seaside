tests
testJavascript
	self 
		assert: [ :html | html div onClick: (html javascript add: self mock; add: self mock; yourself) ]
		renders: '<div onclick="mock;mock"></div>'