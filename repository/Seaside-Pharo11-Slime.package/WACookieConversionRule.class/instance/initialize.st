initialization
initialize

	super initialize.
	self
		replace: '``@a oldNetscapeString' with: '``@a rfc6265String';
		replace: '``@a rfc2109String' with: '``@a rfc6265String';
		replace: '``@a rfc2965String' with: '``@a rfc6265String'