convenience-headers
frameOptions: aString
	"This header will be deprecated and it's functionality will be moved to Content-Security-Policy 1.1 (which does not have the same level of support yet)."
	
	self
		headerAt: 'X-Frame-Options'
		put: aString