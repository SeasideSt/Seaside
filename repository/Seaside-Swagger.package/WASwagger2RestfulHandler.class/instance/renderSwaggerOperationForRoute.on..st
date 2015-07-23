rendering
renderSwaggerOperationForRoute: aRoute on: swagger
	
	"Describes a single API operation on a path."

	aRoute tags ifNotNil: [ :tags | swagger tags: tags ].
	aRoute route seasideMimeType ifNotNil: [ :mimetype |
		swagger produces: mimetype greaseString ].
	"todo: consumes"
	swagger responses: [
		self renderSwaggerResponsesForRoute: aRoute on: swagger ]