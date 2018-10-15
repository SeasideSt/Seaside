utilities
parseJSON: aString
	"Takes a well-formed JSON string and returns the resulting JavaScript object."
	self 
		greaseDeprecatedApi: 'JQueryClass>>#parseJSON'
		details: 'See https://jquery.com/upgrade-guide/3.0/#deprecated-jquery-parsejson'.
	
	self call: 'parseJSON' with: aString