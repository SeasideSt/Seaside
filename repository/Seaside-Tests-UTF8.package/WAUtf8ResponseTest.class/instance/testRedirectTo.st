tests
testRedirectTo
	| url |
	url :=  WAUrl absolute: 'http://www.seaside.st/'.
	url addToPath: self unicodeString.
	self response redirectTo: url.
	self assertLines:  #('HTTP/1.1 302 Found'
		'Location: http://www.seaside.st/%C2%A5%C2%A3%E2%82%AC%24%C2%A2%E2%82%A1%E2%82%A2%E2%82%A3%E2%82%A4%E2%82%A5%E2%82%A6%E2%82%A7%E2%82%A8%E2%82%A9%E2%82%AA%E2%82%AB%E2%82%AD%E2%82%AE%E2%82%AF'
		'Content-Length: 0' '')