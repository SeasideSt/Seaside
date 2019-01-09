rendering
renderSwaggerOperationForRoute: aRouteWrapper on: swagger
	
	"Describes a single API operation on a path."

	| tags methodComment |
	tags := aRouteWrapper tags.
	tags isEmptyOrNil ifFalse: [
		swagger tags: tags ].
	aRouteWrapper route seasideMimeType ifNotNil: [ :mimetype |
		swagger produces: mimetype greaseString ].
	aRouteWrapper route consumes seasideMimeType ifNotNil: [ :mimetype |
		swagger consumes: mimetype greaseString ].
	methodComment := GRPlatform current methodCommentOf: aRouteWrapper route selector in: self class.
	methodComment isEmptyOrNil ifFalse: [ 
		swagger description: methodComment ].
	swagger responses: [
		self renderSwaggerResponsesForRoute: aRouteWrapper on: swagger ]