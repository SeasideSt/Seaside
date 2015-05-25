options
data: anObject
	"Data to be sent to the server. It is converted to a query string, if not already a string. It's appended to the url for GET-requests. See processData option to prevent this automatic processing. Object must be Key/Value pairs. If value is an Array, jQuery serializes multiple values with same key i.e. {foo:['bar1', 'bar2']} becomes '&foo=bar1&foo=bar2'."
	
	self optionAt: 'data' put: anObject