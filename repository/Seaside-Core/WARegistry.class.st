"
WARegistry maintains a set of handlers indexed by a key which it assigns when the handler is registerd. WARegistry checks incoming request URLs for a key and looks for a matching active request handler. If one exists, the request is sent to the proper handler. If not, the request is either a new request (in which case #handleDefaultRequest: is called) or a request to a now-inactive handler (in which case #handleExpiredRequest: is called). These two methods allow subclasses to properly handle these requests.

Subclasses must implement the following messages:
	handleDefaultRequest:
		Handle a request without a session key, ie a new request.
	handlerField
		The URL parameter in which to store the request handler key.

Instance Variables:
	cache - an instance of WACache to hold the stored request handlers

"
Class {
	#name : #WARegistry,
	#superclass : #WARequestHandler,
	#instVars : [
		'cache'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #testing }
WARegistry class >> isAbstract [
	^ self name = #WARegistry
]

{ #category : #accessing }
WARegistry >> cache [
	^ cache
]

{ #category : #accessing }
WARegistry >> cache: aCache [
	cache := aCache
]

{ #category : #'parent/child' }
WARegistry >> childrenDo: aBlock [
	self cache keysAndValuesDo: [ :key :value | aBlock value: value ]
]

{ #category : #'parent/child' }
WARegistry >> clear [
	"Remove all registered handlers."

	self cache clear
]

{ #category : #initialization }
WARegistry >> createCache [
	^ WAMutualExclusionCache on: WABidirectionalCache new
]

{ #category : #configuration }
WARegistry >> defaultConfiguration [
	^ super defaultConfiguration
		removeParent: WARequestHandlingConfiguration instance;
		addParent: WARegistryConfiguration instance;
		yourself
]

{ #category : #'handling-helpers' }
WARegistry >> dispatch: aRequestContext to: aRequestHandler key: aString [
	"This method is used by the handling methods to trigger the dispatch of a request
	to the specified handler."
	
	self trackingStrategy addKey: aString toContext: aRequestContext.
	aRequestHandler handle: aRequestContext

]

{ #category : #'handling-helpers' }
WARegistry >> handle: aRequestContext registering: aRequestHandler [
	"Register a new handler and then dispatch the request to it. A cookie may need
	to be added to the response with the handler's key."
	
	| key |
	key := self register: aRequestHandler.
	self dispatch: aRequestContext to: aRequestHandler key: key
]

{ #category : #'handling-helpers' }
WARegistry >> handle: aRequestContext registering: aRequestHandler at: aKey [
	"Register a new handler at the given key and then dispatch the request to it. A cookie may need
	to be added to the response with the handler's key."
	
	self register: aRequestHandler at: aKey.
	self dispatch: aRequestContext to: aRequestHandler key: aKey
]

{ #category : #handling }
WARegistry >> handleDefault: aRequestContext [ 
	"This method is called whenever a request is received with no key specified. This method can be overridden by subclasses to register a new handler to handle the request."
	
	aRequestContext responseGenerator
		notFound;
		respond
]

{ #category : #handling }
WARegistry >> handleExpired: aRequestContext [ 
 	"This method is called whenever a request is received with a key that does not match a registered handler."	
 			 	
 	aRequestContext request isXmlHttpRequest ifTrue: [
 		^ aRequestContext responseGenerator
 			forbidden;
 			respond ].
 	
 	"Previously, Seaside used to send a redirect response (302) with the
 	'Location' header set to the same path as in the request (if possible).
 	Any session cookie would at this point have been set for deletion (i.e.
 	a 'Set-Cookie' header with a request for deletion would have been set).
 	Unfortunately, user-agents across the board don't play well with 'Set-Cookie'
 	and redirect responses.
 	Hence, we proceed and respond as usual. If a session is to be created,
 	another 'Set-Cookie' header will tell the browser to use the new
 	session identifier from now on.
 	Nice side-effect: user-agents will no longer need to perform the additional
 	redirect when a stale cookie is still in the cache.
 	
 	See https://github.com/SeasideSt/Seaside/issues/916."
 	self handleDefault: aRequestContext
]

{ #category : #handling }
WARegistry >> handleFiltered: aRequestContext [
	| key handler |
	key := self trackingStrategy keyFromContext: aRequestContext.
	key isNil
		ifTrue: [
			self handleDefault: aRequestContext ]
		ifFalse: [
			handler := self cache at: key ifAbsent: [ nil ].
			handler isNil
				ifTrue: [
					self trackingStrategy noHandlerFoundForKey: key in: self context: aRequestContext ]
				ifFalse: [
					self handleKeyed: handler with: key context: aRequestContext ] ]
]

{ #category : #handling }
WARegistry >> handleKeyed: aRequestHandler with: aString context: aRequestContext [
	"This method is called whenever a request is received with a key that matches
	a registered handler."
	
	self dispatch: aRequestContext to: aRequestHandler key: aString
]

{ #category : #enumerating }
WARegistry >> handlersDo: aBlock [
	self keysAndHandlersDo: [ :key :value | aBlock value: value ]
]

{ #category : #initialization }
WARegistry >> initialize [
	super initialize.
	self initializeCache
]

{ #category : #initialization }
WARegistry >> initializeCache [
	cache := self createCache
]

{ #category : #testing }
WARegistry >> isRegistry [
	^ true
]

{ #category : #'parent/child' }
WARegistry >> keyFor: aRequestHandler ifAbsent: absentBlock [
	^ self cache keyAtValue: aRequestHandler ifAbsent: absentBlock
]

{ #category : #enumerating }
WARegistry >> keysAndHandlersDo: aBlock [

	self cache keysAndValuesDo: aBlock
]

{ #category : #copying }
WARegistry >> postCopy [
	super postCopy.
	"Since our handlers are dynamically registered and temporary, it makes
	sense not to copy them."
	cache := self createCache
]

{ #category : #'parent/child' }
WARegistry >> register: aRequestHandler [
	^ self cache store: (aRequestHandler setParent: self; yourself)
]

{ #category : #'parent/child' }
WARegistry >> register: aRequestHandler at: aKey [
	^ self cache at: aKey put: (aRequestHandler setParent: self; yourself)
]

{ #category : #configuration }
WARegistry >> trackingStrategy [
	^ self configuration at: #trackingStrategy
]

{ #category : #'parent/child' }
WARegistry >> unregister: aRequestHandler [
	^ self cache remove: aRequestHandler
]

{ #category : #'parent/child' }
WARegistry >> unregisterAt: aKey [
	^ self cache removeKey: aKey
]

{ #category : #'parent/child' }
WARegistry >> unregistered [
	super unregistered.
	self clear
]

{ #category : #accessing }
WARegistry >> urlFor: aRequestHandler [
	^ self
		urlFor: aRequestHandler
		ifAbsent: [ WAUnregisteredHandlerError signal ]
]

{ #category : #accessing }
WARegistry >> urlFor: aRequestHandler ifAbsent: absentBlock [
	"Return the URL for the given request handler. If the handler is not registered, return
	the result of absentBlock.
	This URL will include the handler's key; if you don't want this, use #url instead."

	| key url |
	key := self keyFor: aRequestHandler ifAbsent: [ ^ absentBlock value ].
	url := self url.
	self trackingStrategy addKey: key toUrl: url.
	^ url
]
