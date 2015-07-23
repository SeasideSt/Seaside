rendering
renderSwaggerInfoOn: swagger
	"The object provides metadata about the API. The metadata can be used by the clients if needed, and can be presented in the Swagger-UI for convenience."
	
	swagger
		title: self applicationTitle;
		version: self apiVersion