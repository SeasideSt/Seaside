"
WADispatcher takes http requests and dispatches them to the correct handler (WAApplication, WAFileHandler, etc). 

WADispatcher class>>default is the top level dispatcher. When a Seaside application is registered as ""foo"" the application is added to the top level dispatcher. The application is added to the entryPoints of the dispatcher at the key ""foo"". If a Seaside application is registered as ""bar/foo"" then the application isadded to a  dispatcher's entryPoints at the key ""foo"". That dispatcher is in the top level dispatcher's  entryPoints at the key ""bar"". 
  
When a http request is received it is sent to WADispatcher class>>default to find the correct handler for the request. If a handler exists for the request is sent to that handler. Otherwise the request is sent to the not found response generator.

The VW port maintains multiple copies of the tree of dispatchers rooted at WADispatcher class>>default. One copy is for each different URL that can reach Seaside (http://..../seaside/go/counter - normal, http://..../counter - SeasideShortPath, http://..../seaside/stream/counter - streaming). 

Instance Variables:
	defaultName	<String>
	entryPoints	<(Dictionary of: WAEntryPoint)>	 the keys are strings, which are the names and URL path segments for the handler at that key

"
Class {
	#name : #WADispatcher,
	#superclass : #WARequestHandler,
	#instVars : [
		'defaultName',
		'handlers'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #accessing }
WADispatcher class >> default [
	^ default ifNil: [ default := self new ]
]

{ #category : #accessing }
WADispatcher class >> description [
	^ 'Dispatcher'
]

{ #category : #initialization }
WADispatcher class >> resetDefault [
	default := nil
]

{ #category : #'parent/child' }
WADispatcher >> childrenDo: aBlock [
	handlers do: aBlock
]

{ #category : #accessing }
WADispatcher >> defaultHandler [
	self defaultName isNil ifTrue: [ ^ nil ].
	^ self handlerAt: self defaultName ifAbsent: [ nil ]
]

{ #category : #accessing }
WADispatcher >> defaultName [
	^ defaultName
]

{ #category : #accessing }
WADispatcher >> defaultName: aString [
	defaultName := aString
]

{ #category : #handling }
WADispatcher >> handleDefault: aRequestContext [
	self defaultName isNil
		ifTrue: [ aRequestContext responseGenerator forbidden; respond ]
		ifFalse: [ self handleFiltered: aRequestContext named: self defaultName ]
]

{ #category : #handling }
WADispatcher >> handleFiltered: aRequestContext [
	| consumer |
	consumer := aRequestContext consumer.
	consumer atEnd
		ifTrue: [ self handleDefault: aRequestContext ]
		ifFalse: [ self handleFiltered: aRequestContext named: consumer next ]
]

{ #category : #handling }
WADispatcher >> handleFiltered: aRequestContext named: aString [
	(self 
		handlerAt: aString 
		ifAbsent: [ aRequestContext responseGenerator notFound; respond ])
			handle: aRequestContext
]

{ #category : #accessing }
WADispatcher >> handlerAt: aString [
	^ self
			handlerAt: aString
			with: [ :dispatcher :token |
				dispatcher handlers at: token ] 
]

{ #category : #accessing }
WADispatcher >> handlerAt: aString ifAbsent: aBlock [
	^ self
		handlerAt: (aString
			ifNil: [ ^ aBlock value ])
		with: [ :dispatcher :token |
			dispatcher handlers
				at: token
				ifAbsent: [ ^ aBlock value ] ]
]

{ #category : #accessing }
WADispatcher >> handlerAt: aString with: aBlock [
	| dispatcher |
	dispatcher := self.
	GRPlatform subStringsIn: aString splitBy: $/ do: [ :token |
		dispatcher := aBlock value: dispatcher value: token ].
	^ dispatcher
]

{ #category : #accessing }
WADispatcher >> handlers [
	^ handlers
]

{ #category : #initialization }
WADispatcher >> initialize [
	super initialize.
	handlers := WABidirectionalCache new
]

{ #category : #testing }
WADispatcher >> isDispatcher [
	^ true
]

{ #category : #accessing }
WADispatcher >> nameOfHandler: aRequestHandler [ 
	"Answer the name of the given request handler. Signal an error the given handler is not registered in the receiver."
	^ handlers
		keyAtValue: aRequestHandler
		ifAbsent: [ WAUnregisteredHandlerError signal ]
]

{ #category : #copying }
WADispatcher >> postCopy [
	super postCopy.
	handlers := handlers valuesCollect: [ :each | each copy setParent: self; yourself ]
]

{ #category : #'parent/child' }
WADispatcher >> register: aRequestHandler at: aString [ 
	aString ifNil: [ WAError signal: 'Registration key cannot be nil.' ].
	handlers 
		at: aString
		put: (aRequestHandler setParent: self; yourself).
	^ aRequestHandler
]

{ #category : #'parent/child' }
WADispatcher >> unregister: aRequestHandler [
	handlers 
		removeKey: aRequestHandler name
		ifAbsent: [ ^ nil ].
	^ aRequestHandler unregistered
]

{ #category : #accessing }
WADispatcher >> urlFor: aRequestHandler [
	^ self url
		addToPath: (self nameOfHandler: aRequestHandler);
		yourself
]
