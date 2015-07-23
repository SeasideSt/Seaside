rendering
renderSwaggerObjectOn: swagger
	
	"This is the root document object for the API specification. It combines what previously was the Resource Listing and API Declaration (version 1.2 and earlier) together into one document."
	
	swagger object: [
		swagger
			swagger: self swaggerVersion;
			info: [ self renderSwaggerInfoOn: swagger ];
			basePath: self url;
			paths: [ self renderSwaggerPathsOn: swagger ] ]