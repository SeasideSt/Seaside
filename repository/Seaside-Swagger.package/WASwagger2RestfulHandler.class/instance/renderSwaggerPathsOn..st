rendering
renderSwaggerPathsOn: json

	"Holds the relative paths to the individual endpoints. The path is appended to the basePath in order to construct the full URL. The Paths may be empty, due to ACL constraints."
	
	| theRoutes |
	theRoutes := self swaggerRoutes groupedBy:[:route | route path].
	json object:[
		 theRoutes keysAndValuesDo:[:path :routesForPath |
			json key: path value: [ self renderSwaggerPathItemForRoutes: routesForPath on: json ] ] ]