"
Implements a WARequestFilter that adds support to handle CORS requests.
"
Class {
	#name : 'WACORSFilter',
	#superclass : 'WARequestFilter',
	#instVars : [
		'allowedMethods',
		'allowedHeaders',
		'exposedHeaders',
		'allowsCredentials',
		'maxAge',
		'allowedOrigin'
	],
	#category : 'Seaside-Core-Filter',
	#package : 'Seaside-Core',
	#tag : 'Filter'
}

{ #category : 'headers' }
WACORSFilter >> addAllowedHeader: aString [

	self allowedHeaders add: aString
]

{ #category : 'handling' }
WACORSFilter >> addAllowedHeadersTo: aResponse [

	self allowedHeaders ifNotEmpty: [ :allowed | 
		aResponse
			headerAt: 'Access-Control-Allow-Headers'
			put: (String streamContents: [ :str | 
					 allowed
						 do: [ :allow | str nextPutAll: allow ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]
]

{ #category : 'methods' }
WACORSFilter >> addAllowedMethod: httpMethod [

	self allowedMethods add: httpMethod
]

{ #category : 'handling' }
WACORSFilter >> addAllowedMethodsHeadersTo: aResponse [

	self allowedMethods ifNotEmpty: [ :allowed | 
		aResponse
			headerAt: 'Access-Control-Allow-Methods'
			put: (String streamContents: [ :str | 
					 allowed
						 do: [ :allow | str nextPutAll: allow ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]
]

{ #category : 'handling' }
WACORSFilter >> addAllowedOriginHeaderTo: aResponse [

	allowedOrigin ifNotNil: [
		aResponse headerAt: 'Access-Control-Allow-Origin' put: allowedOrigin.
		allowedOrigin = '*' ifFalse: [ 
			aResponse headerAt: 'Vary' put: 'Origin' ] ]
]

{ #category : 'handling' }
WACORSFilter >> addAllowsCredentialsHeaderTo: aResponse [

	(allowsCredentials notNil and: [ allowsCredentials ]) ifTrue: [
		aResponse
			headerAt: 'Access-Control-Allow-Credentials'
			put: allowsCredentials greaseString ]
]

{ #category : 'handling' }
WACORSFilter >> addCORSHeadersTo: response [

	self addAllowedOriginHeaderTo: response.
	self addAllowedMethodsHeadersTo: response.
	self addExposedHeadersTo: response.
	self addAllowedHeadersTo: response.
	self addMaxAgeHeaderTo: response.
	self addAllowsCredentialsHeaderTo: response
]

{ #category : 'handling' }
WACORSFilter >> addExposedHeadersTo: aResponse [

	self exposedHeaders ifNotEmpty: [ :exposed | 
		aResponse
			headerAt: 'Access-Control-Expose-Headers'
			put: (String streamContents: [ :str | 
					 exposed
						 do: [ :expose | str nextPutAll: expose ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]
]

{ #category : 'handling' }
WACORSFilter >> addMaxAgeHeaderTo: aResponse [

	maxAge ifNotNil: [
		aResponse
			headerAt: 'Access-Control-Max-Age'
			put: maxAge greaseString ]
]

{ #category : 'headers' }
WACORSFilter >> allowAllHeaders [

	self removeAllAllowedHeaders.
	self addAllowedHeader: '*'
]

{ #category : 'origins' }
WACORSFilter >> allowAnyOrigin [

	self allowedOrigin: '*'
]

{ #category : 'accessing' }
WACORSFilter >> allowedHeaders [ 

	^ allowedHeaders
]

{ #category : 'accessing' }
WACORSFilter >> allowedHeaders: anObject [

	allowedHeaders := anObject
]

{ #category : 'accessing' }
WACORSFilter >> allowedMethods [ 

	^ allowedMethods
]

{ #category : 'accessing' }
WACORSFilter >> allowedMethods: anObject [

	allowedMethods := anObject
]

{ #category : 'accessing' }
WACORSFilter >> allowedOrigin [

	^ allowedOrigin
]

{ #category : 'origins' }
WACORSFilter >> allowedOrigin: originUrlString [

	allowedOrigin := originUrlString greaseString
]

{ #category : 'testing' }
WACORSFilter >> allowsAnyOrigin [

	^ allowedOrigin = '*'
]

{ #category : 'accessing' }
WACORSFilter >> allowsCredentials [

	^ allowsCredentials
]

{ #category : 'accessing' }
WACORSFilter >> allowsCredentials: aBoolean [

	allowsCredentials := aBoolean
]

{ #category : 'origins' }
WACORSFilter >> denyAllOrigins [

	allowedOrigin := nil
]

{ #category : 'methods' }
WACORSFilter >> explicitMethods [

	^ #('GET' 'POST' 'HEAD')
]

{ #category : 'accessing' }
WACORSFilter >> exposedHeaders [ 

	^ exposedHeaders
]

{ #category : 'accessing' }
WACORSFilter >> exposedHeaders: aCollection [

	exposedHeaders := aCollection
]

{ #category : 'handling' }
WACORSFilter >> handleCORSFiltered: aRequestContext [

	self addCORSHeadersTo: aRequestContext response.
	super handleFiltered: aRequestContext.
]

{ #category : 'handling' }
WACORSFilter >> handleCORSPreflight: aRequestContext [

	| response |
	response := aRequestContext response.
	self addCORSHeadersTo: response.
	aRequestContext respond
]

{ #category : 'handling' }
WACORSFilter >> handleFiltered: aRequestContext [

	(self isPreflight: aRequestContext request)
		ifTrue: [ self handleCORSPreflight: aRequestContext ]
		ifFalse: [ 
			(self isCORS: aRequestContext request) 
				ifTrue: [ self handleCORSFiltered: aRequestContext ]
				ifFalse: [ super handleFiltered: aRequestContext ] ]
]

{ #category : 'initialization' }
WACORSFilter >> initialize [ 
	
	super initialize.
	allowedHeaders := OrderedCollection new.
	allowedMethods := OrderedCollection new.
	exposedHeaders := OrderedCollection new
]

{ #category : 'testing' }
WACORSFilter >> isCORS: aRequest [

	^ (aRequest headerAt: 'origin') notNil
]

{ #category : 'testing' }
WACORSFilter >> isPreflight: aRequest [

	^ aRequest method = 'OPTIONS' and: [ self isCORS: aRequest ]
]

{ #category : 'accessing' }
WACORSFilter >> maxAge [

	^ maxAge
]

{ #category : 'accessing' }
WACORSFilter >> maxAge: maxAgeInSeconds [

	maxAge := maxAgeInSeconds
]

{ #category : 'headers' }
WACORSFilter >> removeAllAllowedHeaders [

	self allowedHeaders removeAll
]

{ #category : 'methods' }
WACORSFilter >> removeAllMethods [

	self allowedMethods removeAll
]

{ #category : 'methods' }
WACORSFilter >> useExplicitMethods [

	self allowedMethods addAll: self explicitMethods
]
