"
A WAServer is the abstract base class for all servers. Actual servers do not have to subclass it but have to support the protocol:
 - #codec
 - #usesSmalltalkEncoding

Instance Variables
	codec:		<WACodec>

codec
	- the codec used for response conversion from characters to bytes
"
Class {
	#name : #WAServerAdaptor,
	#superclass : #WAObject,
	#instVars : [
		'manager',
		'port',
		'requestHandler',
		'codec'
	],
	#category : 'Seaside-Core-Server'
}

{ #category : #testing }
WAServerAdaptor class >> isAbstract [
	^ self name = #WAServerAdaptor
]

{ #category : #'instance creation' }
WAServerAdaptor class >> manager: aServerManager [
	^ aServerManager register: 
		(self basicNew
			initializeWithManager: aServerManager;
			yourself)
]

{ #category : #'instance creation' }
WAServerAdaptor class >> new [
	^ self manager: WAServerManager default
]

{ #category : #'instance creation' }
WAServerAdaptor class >> port: anInteger [
	^ self new
		port: anInteger;
		yourself
]

{ #category : #'accessing-readonly' }
WAServerAdaptor >> additionalStatusOn: aStream [
]

{ #category : #private }
WAServerAdaptor >> basicStart [
	self subclassResponsibility
]

{ #category : #private }
WAServerAdaptor >> basicStop [
	self subclassResponsibility
]

{ #category : #testing }
WAServerAdaptor >> canStart [
	^ manager notNil and: [ self manager canStart: self ]
]

{ #category : #testing }
WAServerAdaptor >> canStop [
	^ manager notNil and: [ self manager canStop: self ]
]

{ #category : #accessing }
WAServerAdaptor >> codec [
	^ codec
]

{ #category : #accessing }
WAServerAdaptor >> codec: aCodec [
	codec := aCodec
]

{ #category : #converting }
WAServerAdaptor >> contextFor: aNativeRequest [
	"Answer a request context for aNativeRequest."

	^ WARequestContext
		request: (self requestFor: aNativeRequest)
		response: (self responseFor: aNativeRequest)
		codec: self codec
]

{ #category : #defaults }
WAServerAdaptor >> defaultCodec [
	^ GRNullCodec new
]

{ #category : #defaults }
WAServerAdaptor >> defaultPort [
	^ 8080
]

{ #category : #defaults }
WAServerAdaptor >> defaultRequestHandler [
	^ WADispatcher default
]

{ #category : #processing }
WAServerAdaptor >> handle: aRequestContext [
	"Handle the basic request-response loop."

	self handleRequest: aRequestContext.
	self handlePadding: aRequestContext
]

{ #category : #processing }
WAServerAdaptor >> handlePadding: aRequestContext [
	"If you create an error page that's too small, Microsoft Internet Explorer will display its own error page that includes a link to the MSN network search engine rather than your own error page. See <http://www.404-error-page.com/404-error-page-too-short-problem-microsoft-ie.shtml> for details."

	| size |
	size := aRequestContext response stream size.
	^ (size < 512 and: [ #(400 403 404 405 406 408 409 410 500 501 505) includes: aRequestContext response status ])
		ifTrue: [ aRequestContext response nextPutAll: ((String new: 512 - size) atAllPut: $ ) ]
]

{ #category : #processing }
WAServerAdaptor >> handleRequest: aRequestContext [
	"Pass the request context to the appropriate request handler."
	
	[ self requestHandler handle: aRequestContext ]
		on: WAResponseNotification
		do: [ :n | "got a response" ]
]

{ #category : #initialization }
WAServerAdaptor >> initialize [
	super initialize.
	codec := self defaultCodec.
	port := self defaultPort
]

{ #category : #initialization }
WAServerAdaptor >> initializeWithManager: aServerManager [
	self initialize.
	manager := aServerManager
]

{ #category : #testing }
WAServerAdaptor >> isRunning [
	self subclassResponsibility
]

{ #category : #testing }
WAServerAdaptor >> isStarting [
	self subclassResponsibility
]

{ #category : #testing }
WAServerAdaptor >> isStopped [
	self subclassResponsibility
]

{ #category : #testing }
WAServerAdaptor >> isStopping [
	self subclassResponsibility
]

{ #category : #'starting/stopping' }
WAServerAdaptor >> kill [
	self basicStop
]

{ #category : #'accessing-readonly' }
WAServerAdaptor >> manager [
	^ manager
]

{ #category : #accessing }
WAServerAdaptor >> port [
	^ port
]

{ #category : #accessing }
WAServerAdaptor >> port: anObject [
	port := anObject
]

{ #category : #processing }
WAServerAdaptor >> process: aNativeRequest [
	"Process aNativeRequest by converting to a request context, handling the request, and converting the request context back to a native response. Make sure to release the context after processing, to help the garbage collector and avoid having large streams and sockets hanging around if people still refer to the obsolete request context."

	| context |
	context := self contextFor: aNativeRequest.
	^ [ self handle: context.
		"URL -> String conversion in #responseFrom: needs access to request context for codec"
		context push: self requestHandler during: [ self responseFrom: context ] ]
		ensure: [ context destroy ]
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestAddressFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestBodyFor: aNativeRequest [
	"Answer the undecoded request body as a String."
	
	self subclassResponsibility
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestCookiesFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestFieldsFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #converting }
WAServerAdaptor >> requestFor: aNativeRequest [
	"Answer a request object for aNativeRequest."

	^ (WARequest
		method: (self requestMethodFor: aNativeRequest)
		uri: (self requestUrlFor: aNativeRequest)
		version: (self requestVersionFor: aNativeRequest))
			setHeaders: (self requestHeadersFor: aNativeRequest);
			setBody: (self requestBodyFor: aNativeRequest);
			setPostFields: (self requestFieldsFor: aNativeRequest);
			setCookies: (self requestCookiesFor: aNativeRequest);
			setRemoteAddress: (self requestAddressFor: aNativeRequest);
			setSslSessionId: (self sslSessionIdFor: aNativeRequest);
			yourself
]

{ #category : #accessing }
WAServerAdaptor >> requestHandler [
	"We don't set the instance variable here, if nil, because the default
	request handler may change over time and we want to keep using
	the current default if the user hasn't specified one."
	^ requestHandler ifNil: [ self defaultRequestHandler ]
]

{ #category : #accessing }
WAServerAdaptor >> requestHandler: aRequestHandler [
	requestHandler := aRequestHandler
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestHeadersFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestMethodFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestUrlFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #'converting-request' }
WAServerAdaptor >> requestVersionFor: aNativeRequest [
	self subclassResponsibility
]

{ #category : #converting }
WAServerAdaptor >> responseFor: aNativeRequest [
	"Answer a response object for aNativeRequest."

	^ WABufferedResponse on: (self codec encoderFor: (GRPlatform current writeCharacterStreamOn: String new))
]

{ #category : #converting }
WAServerAdaptor >> responseFrom: aRequestContext [
	"Answer a native response from aRequestContext."

	self subclassResponsibility
]

{ #category : #'starting/stopping' }
WAServerAdaptor >> restart [
	self manager restart: self
]

{ #category : #private }
WAServerAdaptor >> shutDown [
]

{ #category : #'converting-request' }
WAServerAdaptor >> sslSessionIdFor: aNativeRequest [
	"Answer the SSL session id or nil if the request wasn't made over SSL or the server adaptor does not support it.
	
	The default implementation answers nil for compatibility and convenience reasons."
	^ nil
]

{ #category : #'starting/stopping' }
WAServerAdaptor >> start [
	self manager start: self
]

{ #category : #private }
WAServerAdaptor >> startUp [
]

{ #category : #'accessing-readonly' }
WAServerAdaptor >> statusString [
	^ self isRunning
		ifTrue: [ 'running' ]
		ifFalse: [ 'stopped' ]
]

{ #category : #'starting/stopping' }
WAServerAdaptor >> stop [
	self manager stop: self
]

{ #category : #registration }
WAServerAdaptor >> unregister [
	self manager unregister: self
]

{ #category : #registration }
WAServerAdaptor >> unregistered [
	manager := nil
]
