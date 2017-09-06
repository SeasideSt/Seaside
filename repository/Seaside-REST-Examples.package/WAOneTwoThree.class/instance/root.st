routes
root
	<get>
	<path: '/'>
	self requestContext redirectTo: (self requestContext request url with: 'one')