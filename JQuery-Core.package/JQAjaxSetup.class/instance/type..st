options
type: aString
	"The type of request to make ('POST' or 'GET'), default is 'GET'. Note: Other HTTP request methods, such as PUT and DELETE, can also be used here, but they are not supported by all browsers."
	
	self optionAt: 'type' put: aString asUppercase