rendering
renderSwaggerResponse: aResponse on: json
	"Describes a single response from an API Operation."
	
	(self perform: aResponse) jsonOn: json