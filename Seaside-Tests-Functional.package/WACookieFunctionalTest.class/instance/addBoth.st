actions
addBoth
	self requestContext response addCookie: self firstCookie.
	self requestContext response addCookie: self secondCookie.
	
	self resetFirst.
	self resetSecond