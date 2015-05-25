testing
testHandleListing
	| response |
	self requestContextWithUrl: '/root/files/WATestingFiles/'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response.
	
	self requestContextWithUrl: '/root/files/WATestingFiles'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response.
	
	self requestContextWithUrl: '/root/files/'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response.
	
	self requestContextWithUrl: '/root/files'.
	requestContext consumer next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assertListing: response