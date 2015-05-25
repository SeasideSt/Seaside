private
userAgent: aString
	self requestContext request headers at: 'user-agent' put: aString