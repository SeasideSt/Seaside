rendering
renderSwaggerPathItemForRoutes: theRoutes on: json
	
	"Describes the operations available on a single path. A Path Item may be empty, due to ACL constraints. 
	The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available."
	
	json object: [ 
		theRoutes do:[:aRoute |
			json key: aRoute route method asLowercase value: [ self renderSwaggerOperationForRoute: aRoute on: json ]
	] ]