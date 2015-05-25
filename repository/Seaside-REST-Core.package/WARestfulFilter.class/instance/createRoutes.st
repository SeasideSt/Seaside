private
createRoutes
	"Creates a collection of routes for the receiver. Override this method in subclasses to explicitely create the routes instead of using the default implementation that builds the routes using annotated methods (pragmas)."

	^ GRPlatform current createRoutesFrom: self class to: WARestfulFilter