tests-conveniance
testRedirectTo
	self response redirectTo: 'http://www.seaside.st/'.
	self assertLines:  #('HTTP/1.1 302 Found' 'Location: http://www.seaside.st/' 'Content-Length: 0' '')