tests-conveniance
testInlineWithFileName
	self response inlineWithFileName: 'bar.txt'.
	self assertLines: #('HTTP/1.1 200 OK' 'Content-Disposition: inline; filename="bar.txt"' 'Content-Length: 0' '')