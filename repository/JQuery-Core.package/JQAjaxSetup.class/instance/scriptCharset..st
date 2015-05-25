options
scriptCharset: aString
	"Only for requests with 'jsonp' or 'script' dataType and 'GET' type. Forces the request to be interpreted as a certain charset. Only needed for charset differences between the remote and local content."
	
	self optionAt: 'scriptCharset' put: aString