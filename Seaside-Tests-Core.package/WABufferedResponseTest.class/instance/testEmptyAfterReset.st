tests-conveniance
testEmptyAfterReset
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the content';
		resetIfPossible.
	self assert: resetPossible.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Length: 0' '')