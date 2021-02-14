"
I generate a Swagger JSON document that describes and documents RESTful APIs.
"
Class {
	#name : #WASwagger2SpecificationCanvas,
	#superclass : #WAJsonCanvas,
	#category : 'Seaside-Swagger-Core'
}

{ #category : #'instance creation' }
WASwagger2SpecificationCanvas class >> builder [
	^ super builder
		documentClass: WAJsonDocument;
		yourself
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> basePath: aString [
	"The base path on which the API is served, which is relative to the host. If it is not included, the API is served directly under the host. The value MUST start with a leading slash (/). The basePath does not support path templating."
	self key: 'basePath' value: aString
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> consumes: aCollectionOfStrings [
	"swagger object: A list of MIME types the APIs can consume. This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types.
	operation object: A list of MIME types the operation can consume. This overrides the consumes definition at the Swagger Object. An empty value MAY be used to clear the global definition. Value MUST be as described under Mime Types."
	self key: 'consumes' value: aCollectionOfStrings
]

{ #category : #'info object' }
WASwagger2SpecificationCanvas >> contact: anObject [
	"The contact information for the exposed API."
	self key: 'contact'  value: [ 
		self object: anObject ]
]

{ #category : #'responses object' }
WASwagger2SpecificationCanvas >> defaultResponse: anObject [
	"The documentation of responses other than the ones declared for specific HTTP response codes. It can be used to cover undeclared responses. Reference Object can be used to link to a response that is defined at the Swagger Object's responses section."
	self key: 'default' value: [ 
		self object: anObject ]
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> definitions: anObject [
	"An object to hold data types produced and consumed by operations."
	self key: 'definitions' value: anObject
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> delete: anObject [
	"A definition of a DELETE operation on this path."
	self method: 'delete' operation: anObject
]

{ #category : #'operation object' }
WASwagger2SpecificationCanvas >> deprecated [
	self deprecated: true
]

{ #category : #'operation object' }
WASwagger2SpecificationCanvas >> deprecated: aBoolean [
	"Declares this operation to be deprecated. Usage of the declared operation should be refrained. Default value is false."
	self key: 'deprecated' value: aBoolean
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> description: aString [
	"info object: A short description of the application. GFM syntax can be used for rich text representation.
	operation object: A verbose explanation of the operation behavior. GFM syntax can be used for rich text representation.
	response object: Required. A short description of the response. GFM syntax can be used for rich text representation."
	self key: 'description' value: aString
]

{ #category : #'contact object' }
WASwagger2SpecificationCanvas >> email: aString [
	"The email address of the contact person/organization. MUST be in the format of an email address."
	self key: 'email' value: aString
]

{ #category : #'response object' }
WASwagger2SpecificationCanvas >> examples: anObject [
	"An example of the response message."
	self key: 'examples' value: [ 
		self object: anObject ]
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> externalDocs: aObject [
	"swagger object: Additional external documentation.
	operation object: Additional external documentation for this operation."
	self key: 'externalDocs' value: aObject
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> externalReference: aString [
	"Allows for an external definition of this path item. The referenced structure MUST be in the format of a Path Item Object. If there are conflicts between the referenced definition and this Path Item's definition, the behavior is undefined."
	self key: '$ref' value: aString
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> get: anObject [
	"A definition of a GET operation on this path."
	self method: 'get' operation: anObject
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> head: anObject [
	"A definition of a HEAD operation on this path."
	self method: 'head' operation: anObject
]

{ #category : #'response object' }
WASwagger2SpecificationCanvas >> headers: anObject [
	"A list of headers that are sent with the response."
	self key: 'headers' value: [ 
		self object: anObject ]
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> host: aString [
	"The host (name or ip) serving the API. This MUST be the host only and does not include the scheme nor sub-paths. It MAY include a port. If the host is not included, the host serving the documentation is to be used (including the port). The host does not support path templating."
	self key: 'host' value: aString
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> info: anObject [
	"Required. Provides metadata about the API. The metadata can be used by the clients if needed."
	self key: 'info' value: [ 
		self object: anObject ]
]

{ #category : #'schema object' }
WASwagger2SpecificationCanvas >> items: anObject [
	self key: 'items' value: [ 
		self object: anObject ]
]

{ #category : #'info object' }
WASwagger2SpecificationCanvas >> license: anObject [
	"The license information for the exposed API."
	self key: 'license' value: [ 
		self object: anObject ]
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> method: aString operation: anObject [
	self key: aString value: [
		self object: anObject ]
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> name: aString [
	"license object: Required. The license name used for the API.
	concat object: The identifying name of the contact person/organization."
	self key: 'name' value: aString
]

{ #category : #'operation object' }
WASwagger2SpecificationCanvas >> operationId: aString [
	"A friendly name for the operation. The id MUST be unique among all operations described in the API. Tools and libraries MAY use the operation id to uniquely identify an operation."
	self key: 'operationId' value: aString
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> options: anObject [
	"A definition of a OPTIONS operation on this path."
	self method: 'options' operation: anObject
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> parameters: anObject [
	"swagger object: An object to hold parameters that can be used across operations. This property does not define global parameters for all operations.
	path item object: A list of parameters that are applicable for all the operations described under this path. These parameters can be overridden at the operation level, but cannot be removed there. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the Swagger Object's parameters. There can be one 'body' parameter at most.
	operation object: A list of parameters that are applicable for this operation. If a parameter is already defined at the Path Item, the new definition will override it, but can never remove it. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the Swagger Object's parameters. There can be one 'body' parameter at most."
	self key: 'parameters' value: [ 
		self object: anObject ]
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> patch: anObject [
	"A definition of a PATCH operation on this path."
	self method: 'patch' operation: anObject
]

{ #category : #'paths object' }
WASwagger2SpecificationCanvas >> path: aString item: anObject [
	self key: aString value: [ 
		self object: anObject ]
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> paths: anObject [
	"Required. The available paths and operations for the API."
	self key: 'paths' value: [ 
		self object: anObject ]
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> post: anObject [
	"A definition of a POST operation on this path."
	self method: 'post' operation: anObject
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> produces: aCollectionOfStrings [
	"swagger object: A list of MIME types the APIs can produce. This is global to all APIs but can be overridden on specific API calls. Value MUST be as described under Mime Types.
	operation object: A list of MIME types the operation can produce. This overrides the produces definition at the Swagger Object. An empty value MAY be used to clear the global definition. Value MUST be as described under Mime Types."
	self key: 'produces' value: aCollectionOfStrings
]

{ #category : #'path item object' }
WASwagger2SpecificationCanvas >> put: anObject [
	"A definition of a PUT operation on this path."
	self method: 'put' operation: anObject
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> responses: anObject [
	"swagger object: An object to hold responses that can be used across operations. This property does not define global responses for all operations.
	operation object: Required. The list of possible responses as they are returned from executing this operation."
	self key: 'responses' value: [ 
		self object: anObject ]
]

{ #category : #'response object' }
WASwagger2SpecificationCanvas >> schema: anObject [
	"A definition of the response structure. It can be a primitive, an array or an object. If this field does not exist, it means no content is returned as part of the response. As an extension to the Schema Object, its root type value may also be 'file'. This SHOULD be accompanied by a relevant produces mime-type."
	self key: 'schema' value: [ 
		self object: anObject ]
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> schemes: aCollectionOfStrings [
	"swagger object: The transfer protocol of the API. Values MUST be from the list: 'http', 'https', 'ws', 'wss'. If the schemes is not included, the default scheme to be used is the one used to access the Swagger definition itself.
	responses object: The transfer protocol for the operation. Values MUST be from the list: 'http', 'https', 'ws', 'wss'. The value overrides the Swagger Object schemes definition."
	self key: 'schemes' value: aCollectionOfStrings
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> security: aCollection [
	"swagger object: A declaration of which security schemes are applied for the API as a whole. The list of values describes alternative security schemes that can be used (that is, there is a logical OR between the security requirements). Individual operations can override this definition.
	operation object: A declaration of which security schemes are applied for this operation. The list of values describes alternative security schemes that can be used (that is, there is a logical OR between the security requirements). This definition overrides any declared top-level security. To remove a top-level security declaration, an empty array can be used."
	self key: 'security' value: aCollection
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> securityDefinitions: anObject [
	"Security scheme definitions that can be used across the specification."
	self key: 'securityDefinitions' value: anObject
]

{ #category : #'responses object' }
WASwagger2SpecificationCanvas >> status: anInteger response: anObject [
	self key: anInteger greaseString value: [ 
		self object: anObject ]
]

{ #category : #'operation object' }
WASwagger2SpecificationCanvas >> summary: aString [
	"A short summary of what the operation does. For maximum readability in the swagger-ui, this field SHOULD be less than 120 characters."
	self key: 'summary' value: aString
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> swagger20 [
	self swagger: '2.0'
]

{ #category : #'swagger object' }
WASwagger2SpecificationCanvas >> swagger: aString [
	"Required. Specifies the Swagger Specification version being used. It can be used by the Swagger UI and other clients to interpret the API listing. The value MUST be '2.0'."
	self key: 'swagger' value: aString
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> tags: aCollection [
	"swagger object: A list of tags used by the specification with additional metadata. The order of the tags can be used to reflect on their order by the parsing tools. Not all tags that are used by the Operation Object must be declared. The tags that are not declared may be organized randomly or based on the tools' logic. Each tag name in the list MUST be unique.
	operation object: A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier."
	self key: 'tags' value: aCollection
]

{ #category : #'info object' }
WASwagger2SpecificationCanvas >> termsOfService: aString [
	"The Terms of Service for the API."
	self key: 'termsOfService' value: aString
]

{ #category : #'info object' }
WASwagger2SpecificationCanvas >> title: aString [
	"Required. The title of the application."
	self key: 'title' value: aString
]

{ #category : #'schema object' }
WASwagger2SpecificationCanvas >> type: anObject [
	self key: 'type' value: anObject
]

{ #category : #ambiguous }
WASwagger2SpecificationCanvas >> url: aString [
	"license object: A URL to the license used for the API. MUST be in the format of a URL.
	concat object: The URL pointing to the contact information. MUST be in the format of a URL."
	self key: 'url' value: aString
]

{ #category : #'info object' }
WASwagger2SpecificationCanvas >> version: aString [
	"Required Provides the version of the application API (not to be confused with the specification version)."
	self key: 'version' value: aString
]
