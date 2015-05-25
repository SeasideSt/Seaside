accessing-cookies
deleteCookie: aCookie 
	"Try to get the path from the closest entry point in the context. This path
	is used in case the browser did not provide the path information in the cookie.
	Trouble is, this method may be called in a context where WACurrentRequestContext
	is not defined or where there is no RequestHandler. In this case, we just use nil and
	pray the cookie has path information or was created without any."
	
	| baseUrl |
	baseUrl := [ self requestContext handler url ] 
		on: WARequestContextNotFound
		do: [ :err | nil ].
	self 
		deleteCookie: aCookie
		path: (baseUrl isNil ifFalse: [ baseUrl pathStringUnencoded ])
		domain: (baseUrl isNil ifFalse: [ baseUrl host ])