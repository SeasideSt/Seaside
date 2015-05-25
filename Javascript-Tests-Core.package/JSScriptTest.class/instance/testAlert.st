tests-utilities
testAlert
	self assert: (self script alert: 'Be Alert') equals: 'alert("Be Alert")'