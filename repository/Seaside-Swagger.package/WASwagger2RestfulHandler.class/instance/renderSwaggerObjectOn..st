rendering
renderSwaggerObjectOn: json
	
	"This is the root document object for the API specification. It combines what previously was the Resource Listing and API Declaration (version 1.2 and earlier) together into one document."
	
	json object:[
		json 
			key: 'swagger' value: self swaggerVersion;
			key: 'info' value: [  self renderSwaggerInfoOn: json ];
			key: 'basePath' value: self swaggerBasePath;
			key: 'paths' value: [  self renderSwaggerPathsOn: json ] ]