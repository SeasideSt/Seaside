"
Implements a WARequestFilter that adds support to handle CORS requests.
"
Class {
	#name : 'WACORSFilter',
	#superclass : 'WARequestFilter',
	#instVars : [
		'allowedOrigins',
		'allowedMethods',
		'allowedHeaders',
		'exposedHeaders',
		'allowsCredentials'
	],
	#category : 'Seaside-Core-Filter',
	#package : 'Seaside-Core',
	#tag : 'Filter'
}

{ #category : 'methods' }
WACORSFilter >> addAllowedMethod: httpMethod [

	self allowedMethods add: httpMethod
]

{ #category : 'headers' }
WACORSFilter >> addAllowedMethodsHeadersTo: aResponse [

	self allowedMethods ifNotEmpty: [ :allowed | 
		aResponse
			headerAt: 'Access-Control-Allow-Methods'
			put: (String streamContents: [ :str | 
					 allowed
						 do: [ :allow | str nextPutAll: allow ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]
]

{ #category : 'origins' }
WACORSFilter >> addAllowedOrigin: originUrlString [

	self allowedOrigins add: originUrlString asString
]

{ #category : 'headers' }
WACORSFilter >> addAllowedOriginHeadersTo: aResponse [

	self allowedOrigins ifNotEmpty: [ :allowed | 
		| allowedOrigin |
		allowedOrigin := allowed first.
		aResponse headerAt: 'Access-Control-Allow-Origin' put: allowedOrigin.
		allowedOrigin = '*' ifFalse: [ 
			aResponse headerAt: 'Vary' put: 'Origin' ] ]
]

{ #category : 'headers' }
WACORSFilter >> addCORSHeadersTo: response [

	self addAllowedOriginHeadersTo: response.
	self addAllowedMethodsHeadersTo: response
]

{ #category : 'headers' }
WACORSFilter >> addExposedHeadersTo: aResponse [

	self exposedHeaders ifNotEmpty: [ :exposed | 
		aResponse
			headerAt: 'Access-Control-Expose-Headers'
			put: (String streamContents: [ :str | 
					 exposed
						 do: [ :expose | str nextPutAll: expose ]
						 separatedBy: [ str nextPutAll: ', ' ] ]) ]
]

{ #category : 'origins' }
WACORSFilter >> allowAnyOrigin [

	self addAllowedOrigin: '*'
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
WACORSFilter >> allowedOrigins [ 

	^ allowedOrigins ifNil: [ allowedOrigins := OrderedCollection new ]
]

{ #category : 'accessing' }
WACORSFilter >> allowedOrigins: anObject [

	allowedOrigins := anObject
]

{ #category : 'testing' }
WACORSFilter >> allowsAnyOrigin [

	^ self allowedOrigins anySatisfy: [ :origin | origin = '*' ]
]

{ #category : 'accessing' }
WACORSFilter >> allowsCredentials [

	^ allowsCredentials
]

{ #category : 'accessing' }
WACORSFilter >> allowsCredentials: anObject [

	allowsCredentials := anObject
]

{ #category : 'origins' }
WACORSFilter >> denyAllOrigins [

	self allowedOrigins removeAll
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
WACORSFilter >> exposedHeaders: anObject [

	exposedHeaders := anObject
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

	"Pass on the aRequestContext to the next filter or handler. Subclasses might override this method to customize the request and response handling."

	(self isPreflight: aRequestContext request)
		ifTrue: [ self handleCORSPreflight: aRequestContext ]
		ifFalse: [ 
			(self isCORS: aRequestContext request) 
				ifTrue: [ self handleCORSFiltered: aRequestContext ]
				ifFalse: [ super handleFiltered: aRequestContext ] ]
]

{ #category : 'private' }
WACORSFilter >> initialize [ 
	
	super initialize.
	allowedOrigins := OrderedCollection new.
	allowedHeaders := OrderedCollection new.
	allowedMethods := OrderedCollection new.
	exposedHeaders := OrderedCollection new.
	allowsCredentials := false
]

{ #category : 'testing' }
WACORSFilter >> isCORS: aRequest [

	^ (aRequest headerAt: 'origin') notNil
]

{ #category : 'testing' }
WACORSFilter >> isPreflight: aRequest [

	^ aRequest method = 'OPTIONS' and: [ self isCORS: aRequest ]
]

{ #category : 'methods' }
WACORSFilter >> removeAllMethods [

	self allowedMethods removeAll
]

{ #category : 'origins' }
WACORSFilter >> removeAllowedOrigin: originUrlString [

	self allowedOrigins remove: originUrlString asString ifAbsent: [ ]
]

{ #category : 'methods' }
WACORSFilter >> useExplicitMethods [

	self allowedMethods addAll: self explicitMethods
]
