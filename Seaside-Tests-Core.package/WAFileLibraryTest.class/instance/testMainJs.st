tests
testMainJs
	| handler response |
	handler := WAFileHandler new.
	self requestContextWithUrl: '/i/dont/care/main.js'.
	self requestContext consumer next; next; next.
	response := self responseAfter: [ handler handle: self requestContext ].
	self assert: response status = 404