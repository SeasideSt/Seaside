rendering
renderSwaggerPathItemForRoutes: theRoutes on: swagger
	
	"Describes the operations available on a single path. A Path Item may be empty, due to ACL constraints. 
	The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available."
	
	theRoutes do: [ :aRoute |
		swagger
			method: aRoute route method asLowercase
			operation: [ self renderSwaggerOperationForRoute: aRoute on: swagger ] ]