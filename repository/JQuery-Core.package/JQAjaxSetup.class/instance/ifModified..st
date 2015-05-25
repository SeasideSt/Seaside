options
ifModified: aBoolean
	"Allow the request to be successful only if the response has changed since the last request. This is done by checking the Last-Modified header. Default value is false, ignoring the header. In jQuery 1.4 this technique also checks the 'etag' specified by the server to catch unmodified data."
	
	self optionAt: 'ifModified' put: aBoolean