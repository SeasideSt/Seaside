"
WARequestContext encapsulates all the knowledge that should be available while processing a single request. It does not matter if this is a request to a static file, an AJAX request, a long Comet request or a normal Seaside requestion.

The request context is valid only during the request that caused it. It should not be stored. Neither within instance variables, nor within the execution stack so that it might be captured by a continuation. In both cases this might lead to memory leaks.
"
Class {
	#name : #WARequestContext,
	#superclass : #WAObject,
	#instVars : [
		'handlers',
		'request',
		'response',
		'codec',
		'consumer',
		'properties'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #'instance creation' }
WARequestContext class >> new [
	self error: self name , ' has to be instantiated with a request and response object.'
]

{ #category : #'instance creation' }
WARequestContext class >> request: aRequest response: aResponse [
	^ self 
		request: aRequest
		response: aResponse
		codec: GRNullCodec new
]

{ #category : #'instance creation' }
WARequestContext class >> request: aRequest response: aResponse codec: aCodec [
	^ self basicNew initializeWithRequest: aRequest response: aResponse codec: aCodec
]

{ #category : #accessing }
WARequestContext >> charSet [
	"Answer the character set to be used for the response.
	First try to take the one from the codec.
	If it is a GRNullCodec take the one from the handler.
	If there's no handler answer nil."
	| codecName handler |
	codecName := self codec name.
	codecName = GRNullCodec codecName
		ifFalse: [ ^ codecName ].
	handler := self handler.
	self handler isNil
		ifFalse: [ ^ handler charSet ].
	^ nil
]

{ #category : #accessing }
WARequestContext >> codec [
	"Answer the Codec that should be used when preparing strings to be returned in the Response."

	^ codec
]

{ #category : #accessing }
WARequestContext >> consumer [
	"Answer the path consumer."
	
	^ consumer
]

{ #category : #initialization }
WARequestContext >> destroy [
	"Clear references to objects when the receiver is no longer required. This helps avoid circular references and reduces memory consumption. This method is called by the WAServerAdaptor after request processing is finished."
	
	self shouldDestroy ifTrue: [
		self request destroy.
		self response destroy.
		handlers := request := response := codec := properties := nil ]
]

{ #category : #actions }
WARequestContext >> dontDestroy [
	"Prevent any objects from being released.
	For debug purposes"
	self properties at: #shouldDestroy put: false
]

{ #category : #'accessing-dynamic' }
WARequestContext >> handler [
	"Answer the current RequestHandler or nil."

	^ self handlers isEmpty ifFalse: [ self handlers first ]
]

{ #category : #accessing }
WARequestContext >> handlers [
	"Answer an OrderedCollection of RequestHandlers that are processing this request. The list is ordered such that the most recent handler is first in the list."

	^ handlers
]

{ #category : #initialization }
WARequestContext >> initializeWithRequest: aRequest response: aResponse codec: aCodec [
	self initialize.
	handlers := OrderedCollection new.
	request := aRequest.
	response := aResponse.
	codec := aCodec.
	aRequest isNil ifFalse: [
		consumer := WAPathConsumer path: aRequest url path copy ]
]

{ #category : #'accessing-dynamic' }
WARequestContext >> newCookie [
	"Create a new cookie. Try to restrict it as much as possible to make stealing it as hard as possible. Some of these restrictions may be too severe for some applications, in which case the sender can relax them."
	
	| cookie baseUrl |
	baseUrl := self handler url.
	cookie := WACookie new
		pathUnencoded: baseUrl pathStringUnencoded
		encoded: (baseUrl pathStringEncodedWith: self codec);
		httpOnly: true;
		yourself.
	baseUrl host isNil ifFalse: [ cookie domain: baseUrl host ].
	baseUrl scheme = 'https' ifTrue: [ cookie secure: true ].
	(baseUrl port notNil and: [ baseUrl host notNil ]) ifTrue: [ cookie port: baseUrl port ].
	^ cookie
]

{ #category : #'accessing-dynamic' }
WARequestContext >> newDocument [
	"Answer a new Document configured to write onto our Response's stream using the
	current Codec. Try to use the Document class specified by the closest Handler
	but fall back on WAHtmlDocument if there is none."
	
	^ self handler isNil
		ifTrue: [
			(WAHtmlDocument
				on: self response stream codec: self codec)
				scriptGenerator: WADefaultScriptGenerator new;
				yourself  ]
		ifFalse: [
			(self handler documentClass
				on: self response stream codec: self codec)
				scriptGenerator: self handler scriptGeneratorClass new;
				yourself ]
]

{ #category : #printing }
WARequestContext >> printOn: aStream [ 
	super printOn: aStream.
	self request isNil 
		ifTrue: [ aStream nextPutAll: ' url: <nil>' ]
		ifFalse: [
			aStream
				nextPutAll: ' url: ';
				print: self request url greaseString ]
]

{ #category : #accessing }
WARequestContext >> properties [
	"Answer a dictionary of request-related properties."
	^ properties ifNil: [ properties := GRSmallDictionary2 new ]
]

{ #category : #actions }
WARequestContext >> push: aRequestHandler during: aBlock [
	"Push aRequestHandler onto the handler stack while evaluating aBlock."
	
	handlers addFirst: aRequestHandler.
	^ [ WACurrentRequestContext use: self during: aBlock ]
		ensure: [ handlers removeFirst ]
]

{ #category : #'accessing-dynamic' }
WARequestContext >> registry [
	"Answer the closest Registry or nil."

	^ handlers 
		detect: [ :each | each isRegistry ]
		ifNone: [ nil ]
]

{ #category : #accessing }
WARequestContext >> request [
	"Answer the current Request object."
	
	^ request
]

{ #category : #actions }
WARequestContext >> respond [
	"Signal a desire to end request processing and return the current Response to the user agent."
	
	WAResponseNotification signal
]

{ #category : #actions }
WARequestContext >> respond: aBlock [
	"Evaluate aBlock with the current Response as a parameter and then signal a desire to end request processing and return the Response to the user agent."

	aBlock value: self response.
	self respond
]

{ #category : #accessing }
WARequestContext >> response [
	"Answer the current Response object."
	
	^ response
]

{ #category : #'accessing-dynamic' }
WARequestContext >> responseGenerator [
	"Answer a ResponseGenerator as configured in the closest RequestHandler."

	^ (self handler isNil 
		ifTrue: [ WAResponseGenerator ]
		ifFalse: [ self handler responseGenerator ])
			on: self
]

{ #category : #accessing }
WARequestContext >> shouldDestroy [
	^ self properties at: #shouldDestroy ifAbsent: [ true ]
]
