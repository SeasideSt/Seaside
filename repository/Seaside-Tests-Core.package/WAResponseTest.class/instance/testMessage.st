tests-status
testMessage
	self assert: self response message = 'OK'.
	
	self response status: 404.
	self assert: self response message = 'Not Found'.
	
	self response status: 290.
	self assert: self response message isNil.
	
	self response status: 290 message: 'Seaside Rocks'.
	self assert: self response message = 'Seaside Rocks'