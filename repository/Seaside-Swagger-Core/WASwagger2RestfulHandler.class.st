"
Implementation of the Swagger 2.0 protocol 

https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md
"
Class {
	#name : #WASwagger2RestfulHandler,
	#superclass : #WARestfulHandler,
	#category : 'Seaside-Swagger-Core'
}

{ #category : #swagger }
WASwagger2RestfulHandler >> apiVersion [
	^ '1.0'
]

{ #category : #swagger }
WASwagger2RestfulHandler >> applicationDescription [
	"Answer the description of the swagger info object."
	^ GRPlatform current classCommentOf: self class
]

{ #category : #swagger }
WASwagger2RestfulHandler >> applicationTitle [
	^ 'Swagger'
]

{ #category : #resources }
WASwagger2RestfulHandler >> getSwaggerSpecificationFile [

	<get>
	<path: '/swagger.json'>
	<produces: 'application/json'>

	^ WASwagger2SpecificationCanvas builder
		render: [ :swagger | self renderSwaggerObjectOn: swagger ]
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerInfoOn: swagger [
	"The object provides metadata about the API. The metadata can be used by the clients if needed, and can be presented in the Swagger-UI for convenience."
	
	| applicationDescription |
	swagger
		title: self applicationTitle;
		version: self apiVersion.
	applicationDescription := self applicationDescription.
	applicationDescription isEmptyOrNil ifFalse: [
		swagger description: applicationDescription ]
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerObjectOn: swagger [
	
	"This is the root document object for the API specification. It combines what previously was the Resource Listing and API Declaration (version 1.2 and earlier) together into one document."
	
	swagger object: [
		swagger
			swagger: self swaggerVersion;
			info: [ self renderSwaggerInfoOn: swagger ];
			basePath: self url;
			paths: [ self renderSwaggerPathsOn: swagger ] ]
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerOperationForRoute: aRouteWrapper on: swagger [
	
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
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerPathItemForRoutes: theRoutes on: swagger [
	
	"Describes the operations available on a single path. A Path Item may be empty, due to ACL constraints. 
	The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available."
	
	theRoutes do: [ :aRoute |
		swagger
			method: aRoute route method asLowercase
			operation: [ self renderSwaggerOperationForRoute: aRoute on: swagger ] ]
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerPathsOn: swagger [

	"Holds the relative paths to the individual endpoints. The path is appended to the basePath in order to construct the full URL. The Paths may be empty, due to ACL constraints."
	
	| theRoutesGroupedByPath |
	theRoutesGroupedByPath := Dictionary new.
	self swaggerRoutes do:[:each |
		(theRoutesGroupedByPath at: each path ifAbsentPut: [ OrderedCollection new ]) add: each ].
	theRoutesGroupedByPath keysAndValuesDo: [ :path :routesForPath |
		swagger path: path item: [
			self renderSwaggerPathItemForRoutes: routesForPath on: swagger ] ]
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerResponse: aResponse on: json [
	"Describes a single response from an API Operation."
	
	(self perform: aResponse) jsonOn: json
]

{ #category : #rendering }
WASwagger2RestfulHandler >> renderSwaggerResponsesForRoute: aRoute on: swagger [
	"A container for the expected responses of an operation. The container maps a HTTP response code to the expected response. 
	It is not expected from the documentation to necessarily cover all possible HTTP response codes, since they may not be known in advance. 
	However, it is expected from the documentation to cover a successful operation response and any known errors.

	The default can be used a default response object for all HTTP codes that are not covered individually by the specification.

	The Responses Object MUST contain at least one response code, and it SHOULD be the response for a successful operation call."
	
	aRoute responses do: [ :response |
		swagger
			key: response key greaseString
			value: [
				self renderSwaggerResponse: response value on: swagger ] ]
]

{ #category : #private }
WASwagger2RestfulHandler >> swaggerRoutes [
	^ WASwaggerRouteBuilder createRoutesFrom: self class to: WARestfulHandler
]

{ #category : #swagger }
WASwagger2RestfulHandler >> swaggerVersion [
	"Specifies the Swagger Specification version being used. It can be used by the Swagger UI and other clients to interpret the API listing. The value MUST be 2.0"
	^ '2.0'
]
