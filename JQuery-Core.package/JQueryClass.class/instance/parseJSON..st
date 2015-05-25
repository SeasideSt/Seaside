utilities
parseJSON: aString
	"Takes a well-formed JSON string and returns the resulting JavaScript object."
	
	self call: 'parseJSON' with: aString