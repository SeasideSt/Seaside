Class {
	#name : #WASwaggerRestfulHandler,
	#superclass : #WARestfulHandler,
	#category : 'Seaside-Swagger'
}

{ #category : #'misc.' }
WASwaggerRestfulHandler >> apiForMethod: method [

	| api seasidePath swaggerPath |
	
	seasidePath := (GRPlatform current pragmaAt: #path: in: method) arguments first asZnUrl.
	swaggerPath := '/' , seasidePath asZnUrl path.

	api := Dictionary new.
	api at: 'description' put: 'From method ' , method selector asString.
	api at: 'path' put: swaggerPath.
	api at: 'operations' put: (Array with: (self operationForMethod: method)).
	^ api
]

{ #category : #versions }
WASwaggerRestfulHandler >> apiVersion [ 
	^ '1.0'
]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> apisForHandler: handler apiKey: apiKey [

	| apis |
	apis := SortedCollection sortBlock: [ :x :y | (x at: 'path') <= (y at: 'path') ].
	(self class allSelectorsBelow: WASwaggerRestfulHandler) do: [ :selector | | method |
		method := self class lookupSelector: selector.
		(GRPlatform current pragmaAt: #noAutoSwaggerInclusion in: method) ifNil: [
			(GRPlatform current pragmaAt: #path: in: method) ifNotNil: [ :pathPragma |
				((pathPragma arguments first asZnUrl) pathSegments first copyUpTo: $.) = handler ifTrue: [
					apis add: (self apiForMethod: method).
	]	]	]	].
	^ apis
]

{ #category : #private }
WASwaggerRestfulHandler >> baseURL [

	^ self baseURLString asZnUrl
]

{ #category : #private }
WASwaggerRestfulHandler >> baseURLString [

	| baseURL |
	baseURL := self url asZnUrl.
	baseURL host ifNil: [
		baseURL port: nil.
		baseURL scheme: self serverProtocol.
		baseURL parseAuthority: self requestContext request host greaseString readStream.
	].
	^ baseURL asStringOrText
]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> getSwaggerResponseForHandler: handler [

	<get>
	<path: '/{handler}.json'>

	self getSwaggerResponseForHandler: handler apiKey: nil.
]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> getSwaggerResponseForHandler: handler apiKey: apiKey [

	<get>
	<path: '/{handler}.json?api_key={apiKey}'>

	(handler = self swaggerResourcesListHandlerName) ifTrue: [
		self swaggerResourcesForAPIKey: apiKey
	] ifFalse: [
		self swaggerOperationsForHandler: handler apiKey: apiKey
	].
]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> handlersForAPIKey: apiKey [

	| handlers |
	handlers := Set new.
	(self class allSelectorsBelow: WASwaggerRestfulHandler) do: [ :selector | | method |
		method := self class lookupSelector: selector.
		(GRPlatform current pragmaAt: #noAutoSwaggerInclusion in: method) ifNil: [
			(GRPlatform current pragmaAt: #path: in: method) ifNotNil: [ :pathPragma |
				(pathPragma arguments first beginsWith: '/') & ((pathPragma arguments first includesSubString: 'api_key') = apiKey notNil) ifTrue: [
					handlers add: ((pathPragma arguments first asZnUrl) pathSegments first copyUpTo: $.).
				].
			].
		].
	].
	^ handlers
]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> modelsForHandler: handler [

	^ Dictionary new

]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> operationForMethod: method [

	| operation params errorResponses |
	
	params := (method pragmas select: [ :pragma | pragma keyword = #Argument:ofType:passedBy:description: ]) collect: [ :pragma |
		Dictionary new
			at: 'name' put: pragma arguments first;
			at: 'allowMultiple' put: false;
			at: 'dataType' put: pragma arguments second;
			at: 'description' put: pragma arguments fourth;
			at: 'paramType' put: pragma arguments third;
			yourself.
	].

	errorResponses := (method pragmas select: [ :pragma | pragma keyword = #Error:reason: ]) collect: [ :pragma |
		Dictionary new
			at: 'code' put: pragma arguments first;
			at: 'reason' put: pragma arguments second;
			yourself.
	].
		
	operation := Dictionary new.
	operation at: 'httpMethod' put: (method pragmas first keyword asUppercase).
	operation at: 'nickname' put: (method selector asString copyReplaceAll: ':' with: '_').
	(GRPlatform current pragmaAt: #Notes: in: method) ifNotNil: [ :notePragma | operation at: 'notes' put: notePragma arguments first ].
	self flag: 'Swagger UI does not need/use the responseClass, but it probably is necessary for the Swagger code generator'.
	(GRPlatform current pragmaAt: #ResponseClass: in: method) ifNotNil: [ :responseClassPragma | operation at: 'responseClass' put: responseClassPragma arguments first ].
	(GRPlatform current pragmaAt: #Summary: in: method) ifNotNil: [ :summaryPragma | operation at: 'summary' put: summaryPragma arguments first ].
	operation at: 'parameters' put: params.
	operation at: 'errorResponses' put: errorResponses.
	^ operation

]

{ #category : #private }
WASwaggerRestfulHandler >> respondJson: anObject [
	self requestContext respond: [ :response | 
			response stream json: anObject ]
]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> swaggerOperationsForHandler: handler apiKey: apiKey [

	| body operations1 api1 apis operation1 api2 operations2 operation2 op2param1 op2params |
	
	apis := self apisForHandler: handler apiKey: apiKey.
	
	body := Dictionary new.
	body at: 'basePath' put: self baseURL printString.
	body at: 'swaggerVersion' put: self swaggerVersion.
	body at: 'apiVersion' put: self apiVersion.
	body at: 'resourcePath' put: '/',handler.
	body at: 'models' put: (self modelsForHandler: handler).
	body at: 'apis' put: apis.

	self respondJson: body.

]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> swaggerResourcesForAPIKey: apiKey [

	| apis resources description handlers |
	
	handlers := self handlersForAPIKey: apiKey.
	
	apis := OrderedCollection new.
	resources := Dictionary new.
	(handlers asSortedCollection) do: [ :handler |
		apis add: (Dictionary new 
			at: 'path' put: '/',handler,'.{format}';
			at: 'description' put: 'Operations for ' , handler;
			yourself).
	].
	resources at: 'apis' put: apis.
	resources at: 'basePath' put: self baseURL printString.
	resources at: 'swaggerVersion' put: self swaggerVersion.
	resources at: 'apiVersion' put: self apiVersion.
	self respondJson: resources.

]

{ #category : #'misc.' }
WASwaggerRestfulHandler >> swaggerResourcesListHandlerName [

	^ 'resources'
]

{ #category : #versions }
WASwaggerRestfulHandler >> swaggerVersion [ 
	^ '2.0'
]
