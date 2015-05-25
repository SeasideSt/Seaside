rendering
renderSwaggerOperationForRoute: aRoute on: json
	
	"Describes a single API operation on a path."

	json object:[
		aRoute tags ifNotNil:[:tags | json key: 'tags' value: tags ].
		aRoute route seasideMimeType ifNotNil:[:mimetype | json key: 'produces' value: mimetype greaseString ].
		json key: 'responses' value: [ self renderSwaggerResponsesForRoute: aRoute on: json ]
		]