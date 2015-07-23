response object
schema: anObject
	"A definition of the response structure. It can be a primitive, an array or an object. If this field does not exist, it means no content is returned as part of the response. As an extension to the Schema Object, its root type value may also be 'file'. This SHOULD be accompanied by a relevant produces mime-type."
	self key: 'schema' value: [ 
		self object: anObject ]