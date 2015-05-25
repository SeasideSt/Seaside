tests
testRobotsTxt
	self assertPerformGetTo: #('robots.txt') equals: handler robotsTxt contentType: (WAMimeType fromString: 'text/plain;charset=utf-8')