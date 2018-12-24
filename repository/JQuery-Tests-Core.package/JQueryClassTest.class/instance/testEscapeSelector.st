tests-utilities
testEscapeSelector
	self
		assert: (self jQuery escapeSelector: '#foobar')
		equals: self function , '.escapeSelector("#foobar")'