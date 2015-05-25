tests-conveniance
testCanResetIfNoBody
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		resetIfPossible.
	self assert: resetPossible.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Length: 0' '')