rendering
renderSwaggerInfoOn: swagger
	"The object provides metadata about the API. The metadata can be used by the clients if needed, and can be presented in the Swagger-UI for convenience."
	
	| applicationDescription |
	swagger
		title: self applicationTitle;
		version: self apiVersion.
	applicationDescription := self applicationDescription.
	applicationDescription isEmptyOrNil ifFalse: [
		swagger description: applicationDescription ]