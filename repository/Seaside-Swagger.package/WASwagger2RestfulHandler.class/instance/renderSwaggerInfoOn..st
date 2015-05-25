rendering
renderSwaggerInfoOn: json
	"The object provides metadata about the API. The metadata can be used by the clients if needed, and can be presented in the Swagger-UI for convenience."
	
	json object: [ 
		json 
			key: 'title' value: self applicationTitle;
			key: 'version' value: self apiVersion ]