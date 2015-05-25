tests-conveniance
testAttachmentWithFileName
	self response attachmentWithFileName: 'foo.txt'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Disposition: attachment; filename="foo.txt"' 'Content-Length: 0' '')