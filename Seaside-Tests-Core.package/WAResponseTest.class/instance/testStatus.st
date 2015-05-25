tests-status
testStatus
	self assert: self response status = 200.
	self response status: 404.
	self assert: self response status = 404