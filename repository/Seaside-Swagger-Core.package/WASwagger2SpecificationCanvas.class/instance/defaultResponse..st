responses object
defaultResponse: anObject
	"The documentation of responses other than the ones declared for specific HTTP response codes. It can be used to cover undeclared responses. Reference Object can be used to link to a response that is defined at the Swagger Object's responses section."
	self key: 'default' value: [ 
		self object: anObject ]