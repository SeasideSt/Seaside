utilities
parseJSON: aString
	"Takes a well-formed JSON string and returns the resulting JavaScript object."
	self 
		greaseDeprecatedApi: 'JQueryClass>>#parseJSON'
		details: 'Deprecated in jQuery 3. Prefer #jsonFromString:.'.
	
	self call: 'parseJSON' with: aString