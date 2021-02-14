"
I convert between Seaside and Zinc HTTP requests and responses.
I am a WAServerAdaptor.

Instance Variables:
	server	<ZnServer>
		
I can be started like any other Seaside adaptor:

	ZnZincServerAdaptor startOn: 8080
	
I work together with a ZnSeasideServerAdaptorDelegate. I offer several advanced configuration options for specialized applications in my 'initialize-release' protocol. See also the 'example' class protocol of ZnSeasideServerAdaptorDelegate. 
"
Class {
	#name : #ZnZincServerAdaptor,
	#superclass : #WAServerAdaptor,
	#instVars : [
		'server'
	],
	#category : 'Zinc-Seaside'
}

{ #category : #private }
ZnZincServerAdaptor >> basicStart [
	self server start
]

{ #category : #private }
ZnZincServerAdaptor >> basicStop [
	server 
		ifNotNil: [ 
			server stop.
			server := nil ]
]

{ #category : #'initialize-release' }
ZnZincServerAdaptor >> configureDelegate [
	"Set the main delegate of my server to the default one."
	
	server delegate: self defaultDelegate
]

{ #category : #'initialize-release' }
ZnZincServerAdaptor >> configureServerForBinaryReading [
	"Seaside wants to do its own text conversions"

	server reader: [ :stream | ZnRequest readBinaryFrom: stream ]
]

{ #category : #private }
ZnZincServerAdaptor >> convertMultipart: entity [
	| dictionary |
	dictionary := ZnMultiValueDictionary new.
	entity partsDo: [ :each |
		| value |
		value := each fileName isEmptyOrNil 
			ifTrue: [ 
				each hasEntity
					ifTrue: [ self codec url decode: each fieldValueString ]
					ifFalse: [ String new ] ] 
			ifFalse: [ self convertMultipartFileField: each ] .
		dictionary at: each fieldName add: value ].
	^ dictionary
]

{ #category : #private }
ZnZincServerAdaptor >> convertMultipartFileField: part [  
	| file |
	(file := WAFile new)
		fileName: part fileName;
		contentType: part contentType printString;
		contents: (part hasEntity ifTrue: [ part contents asByteArray ] ifFalse: [ #[] ]).
	^ file
]

{ #category : #defaults }
ZnZincServerAdaptor >> defaultCodec [
	^ GRCodec forEncoding: 'utf-8'
]

{ #category : #defaults }
ZnZincServerAdaptor >> defaultDelegate [
	^ ZnSeasideServerAdaptorDelegate with: self
]

{ #category : #defaults }
ZnZincServerAdaptor >> defaultZnServer [
	^ ZnServer on: self port
]

{ #category : #testing }
ZnZincServerAdaptor >> isRunning [
	^ server notNil and: [ server isRunning ]
]

{ #category : #testing }
ZnZincServerAdaptor >> isStarting [
	^ false
]

{ #category : #testing }
ZnZincServerAdaptor >> isStopped [
	^ server isNil or: [ server isRunning not ]
]

{ #category : #testing }
ZnZincServerAdaptor >> isStopping [
	^ false
]

{ #category : #printing }
ZnZincServerAdaptor >> printOn: stream [
	super printOn: stream.
	stream
		nextPut: $(;
		<< self statusString;
		nextPut: $)
]

{ #category : #converting }
ZnZincServerAdaptor >> requestAddressFor: aZincRequest [
	^ aZincRequest  headers
		at: ZnConstants remoteAddressHeader 
		ifAbsent: [ nil ]
]

{ #category : #converting }
ZnZincServerAdaptor >> requestBodyFor: aZincRequest [
	^ (aZincRequest method ~= #TRACE 
		and: [ aZincRequest hasEntity
			and: [ aZincRequest entity isEmpty not
				and: [ (aZincRequest entity contentType matches: ZnMimeType applicationFormUrlEncoded) not
					and: [ (aZincRequest entity contentType matches: ZnMimeType multiPartFormData) not ] ] ] ])
			ifTrue: [
				"Seaside wants to do its own text conversions"
				aZincRequest entity bytes asString ]
			ifFalse: [
				String new ]
]

{ #category : #converting }
ZnZincServerAdaptor >> requestCookiesFor: aZincRequest [
	| cookieString |
	cookieString := aZincRequest headers
		at: 'Cookie' ifAbsent: [ ^ #() ].
	^ WARequestCookie fromString: cookieString codec: self codec
]

{ #category : #converting }
ZnZincServerAdaptor >> requestFieldsFor: aZincRequest [
	| fields |
	fields := WARequestFields new.
	(aZincRequest method = #POST and: [ aZincRequest hasEntity ])
		ifTrue: [ 
			(aZincRequest entity contentType matches: ZnMimeType applicationFormUrlEncoded)
				ifTrue: [
					fields addAll: aZincRequest entity fields ].
			(aZincRequest entity contentType matches: ZnMimeType multiPartFormData)
				ifTrue: [
					fields addAll: (self convertMultipart: aZincRequest entity) ] ].
	^ fields
]

{ #category : #converting }
ZnZincServerAdaptor >> requestHeadersFor: aZincRequest [
	| fields |
	fields := Dictionary new.
	aZincRequest headersDo: [ :key :value |
		fields at: key asLowercase put: value ].
	^ fields
]

{ #category : #converting }
ZnZincServerAdaptor >> requestMethodFor: aZincRequest [
	^ aZincRequest method greaseString
]

{ #category : #converting }
ZnZincServerAdaptor >> requestUrlFor: aZincRequest [
	| zincUrl seasideUrl |
	zincUrl := aZincRequest url.
	seasideUrl := WAUrl new
		scheme: zincUrl schemeOrDefault greaseString;
		host: zincUrl host;
		port: zincUrl port;
		fragment: zincUrl fragment.
	zincUrl hasPath ifTrue: [
		zincUrl isDirectoryPath
			ifTrue: [ "last path segment is $/ or #/"
					zincUrl pathSegments
						"GemStone/S currently does not support #allButLastDo:"
						allButLast do: [ :each | seasideUrl rawAddToPath: each ].
					seasideUrl slash: true ]
			ifFalse: [ seasideUrl rawAddAllToPath: zincUrl pathSegments ] ].
	zincUrl
		queryDo: [ :key :value | seasideUrl addField: key value: value ].
	^ seasideUrl
]

{ #category : #converting }
ZnZincServerAdaptor >> requestVersionFor: aZincRequest [
	^ WAHttpVersion fromString: aZincRequest requestLine version
]

{ #category : #converting }
ZnZincServerAdaptor >> responseFrom: aRequestContext [
	| partialHeaders cookies fullHeaders seasideResponse contents entity contentType |
	seasideResponse := aRequestContext response.
	partialHeaders := seasideResponse headers.
	cookies := seasideResponse cookies.
	fullHeaders := ZnHeaders defaultResponseHeaders.
	partialHeaders keysAndValuesDo: [ :key :value |
		fullHeaders at: key add: value greaseString ].
	cookies do: [ :each |
		fullHeaders at: 'Set-Cookie' add: each rfc6265String ].
	contentType := seasideResponse contentType greaseString.
	contents := seasideResponse contents.
	entity := (ZnEntity bytes: contents) contentType: contentType; yourself.
	^ ZnResponse new
		statusLine: (ZnStatusLine code: seasideResponse status);
		headers: fullHeaders;
		entity: entity;
		yourself
]

{ #category : #accessing }
ZnZincServerAdaptor >> server [
	"Return the ZnServer running me, create a default one if missing and confugure it."

	server
		ifNil: [ 
			server := self defaultZnServer.
			self
				configureDelegate;
				configureServerForBinaryReading ].
	^ server
]

{ #category : #'initialize-release' }
ZnZincServerAdaptor >> server: znServer [
	"I initialize the actual ZnServer instance that I will be using to znServer, 
	to prevent a fallback to #defaultZnServer"
	
	server := znServer.
	port := znServer port
]

{ #category : #'initialize-release' }
ZnZincServerAdaptor >> serverClass: znServerClass [
	"I initialize the actual ZnServer instance that I will be using, 
	by instanciating znServerClass using my port"
	
	self server: (znServerClass on: self port)
]

{ #category : #private }
ZnZincServerAdaptor >> shutDown [
	self isRunning
		ifTrue: [ server stop ]
]

{ #category : #private }
ZnZincServerAdaptor >> startUp [
	self isRunning
		ifFalse: [ server ifNotNil: [ server start ] ]
]

{ #category : #accessing }
ZnZincServerAdaptor >> statusString [
	^ 'zinc on port ', self port greaseString, 
		( self isRunning ifTrue: [ ' [running]' ] ifFalse: [ ' [stopped]' ] )
]
