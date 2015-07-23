response object
headers: anObject
	"A list of headers that are sent with the response."
	self key: 'headers' value: [ 
		self object: anObject ]