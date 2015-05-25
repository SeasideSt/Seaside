actions
addFirst
	self requestContext response addCookie: self firstCookie.
	
	self resetFirst