tests-conveniance
testCantReset
	| resetPossible |
	resetPossible := self response
		status: WAResponse statusNotFound;
		attachmentWithFileName: 'upload.csv';
		nextPutAll: 'the content';
		resetIfPossible.
	self deny: resetPossible.
	self assertLines: #('HTTP/1.1 404 Not Found' 'Content-Disposition: attachment; filename="upload.csv"' '' 'the content')