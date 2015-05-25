testing
testHandleDoesNotExist
	| response |
	self requestContextWithUrl: '/root/files/Cheeseburger/'.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertNotExisiting: response.
	
	self requestContextWithUrl: '/root/files/Cheeseburger'.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertNotExisiting: response.
	
	self requestContextWithUrl: '/root/files/WAStandardFiles/cheeseburger.jpeg'.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertNotExisiting: response