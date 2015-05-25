tests
testIsCommitted
	self deny: self response isCommitted.
	self response contentType: 'text/html'.

	self deny: self response isCommitted.
	self response nextPutAll: 'Visit <a href="http://www.seaside.st">seaside.st</a>.'.

	self assertLines: #('HTTP/1.1 200 OK' 'Content-Type: text/html' 'Content-Length: 53' '' 'Visit <a href="http://www.seaside.st">seaside.st</a>.')