public
addKey: aString toUrl: aUrl
	"Only add a query field if there isn't already a cookie"
	self
		cookieFromContext: self requestContext
		ifAbsent: [ self addQueryFieldWithValue: aString to: aUrl ]