"
WARequestHandler is an abstract class whose subclasses handle http requests. Most of the methods are either empty or return a default value. 

Subclasses must implement the following messages:
	handleFiltered:	process the request


"
Class {
	#name : #WARequestHandler,
	#superclass : #WAObject,
	#instVars : [
		'filter',
		'parent',
		'configuration'
	],
	#category : 'Seaside-Core-RequestHandling'
}

{ #category : #accessing }
WARequestHandler class >> concreteSubclasses [
	^ self allSubclasses reject: [ :each | each isAbstract ]
]

{ #category : #accessing }
WARequestHandler class >> description [
	^ self name greaseString
]

{ #category : #testing }
WARequestHandler class >> isAbstract [
	^ self name = #WARequestHandler
]

{ #category : #filters }
WARequestHandler >> addFilter: aFilter [
	"Add aFilter to the receiver. Answer the filter added."

	^ self addFilterLast: aFilter
]

{ #category : #filters }
WARequestHandler >> addFilterFirst: aFilter [
	"Add aFilter as the first one in the filter chain. Answer the filter added."

	aFilter setNext: self filter.
	self setFilter: aFilter.
	^ aFilter
]

{ #category : #filters }
WARequestHandler >> addFilterLast: aFilter [
	"Add aFilter as the last one in the filter chain. Answer the filter added."

	| previous current |
	previous := nil.
	current := self filter.
	[ current = self ] whileFalse: [
		previous := current.
		current := current next ].
	aFilter setNext: current.
	previous isNil
		ifTrue: [ self setFilter: aFilter ]
		ifFalse: [ previous setNext: aFilter ].
	^ aFilter
]

{ #category : #private }
WARequestHandler >> authConfigurationError: aString [
	WAAuthConfigurationError signal: aString
]

{ #category : #private }
WARequestHandler >> basicUrl [
	^ self isRoot
		ifTrue: [ WAUrl new ]
		ifFalse: [ self parent urlFor: self ]
]

{ #category : #configuration }
WARequestHandler >> charSet [
	^ self preferenceAt: #charSet
]

{ #category : #'parent/child' }
WARequestHandler >> childrenDo: aBlock [
	"Request handlers that act as containers should implement this method to
	iterate over all child handlers and pass each into aBlock."
]

{ #category : #configuration }
WARequestHandler >> configuration [
	^ configuration
]

{ #category : #configuration }
WARequestHandler >> configuration: aConfiguration [
	configuration := aConfiguration
]

{ #category : #copying }
WARequestHandler >> copyTo: aRequestHandler [
	^ aRequestHandler
]

{ #category : #configuration }
WARequestHandler >> defaultConfiguration [
	^ WAUserConfiguration new
		addParent: WARequestHandlingConfiguration instance;
		yourself
]

{ #category : #configuration }
WARequestHandler >> documentClass [
	^ (self preferenceAt: #documentClass) value
]

{ #category : #'filters-convenience' }
WARequestHandler >> exceptionHandler: anExceptionHandlerClass [
	| theFilter |
	theFilter := self filters
		detect: [ :ea | ea isExceptionFilter ]
		ifNone: [ self addFilter: WAExceptionFilter new ].
	
	theFilter configuration at: #exceptionHandler put: anExceptionHandlerClass
]

{ #category : #'private-accessing' }
WARequestHandler >> filter [
	^ filter contents
]

{ #category : #filters }
WARequestHandler >> filters [
	"Answer an ordered collection of all filters active in the receiver."
	
	| current result |
	current := self filter.
	result := OrderedCollection new.
	[ current = self ] whileFalse: [
		result add: current.
		current := current next ].
	^ result
]

{ #category : #handling }
WARequestHandler >> handle: aRequestContext [
	"Handle a request described by aRequestContext. Do not override this method; instead subclass #handleFiltered: to allow filters to process the request first."

	aRequestContext push: self during: [ self filter handleFiltered: aRequestContext ]
]

{ #category : #handling }
WARequestHandler >> handleFiltered: aRequestContext [ 
	"Handle aRequestContext by either dispatching to a different request handler of by producing a response and singalling the result."

	self subclassResponsibility
]

{ #category : #filters }
WARequestHandler >> handler [
	^ self
]

{ #category : #initialization }
WARequestHandler >> initialize [
	super initialize.
	configuration := self defaultConfiguration.
	filter := WAValueHolder with: self
]

{ #category : #testing }
WARequestHandler >> isDispatcher [
	^ false
]

{ #category : #testing }
WARequestHandler >> isRegistry [
	^ false
]

{ #category : #testing }
WARequestHandler >> isRoot [
	^ self parent isNil
]

{ #category : #accessing }
WARequestHandler >> name [
	^ self isRoot
		ifTrue: [ '' ]
		ifFalse: [ self parent nameOfHandler: self ]
]

{ #category : #accessing }
WARequestHandler >> parent [
	^ parent
]

{ #category : #enumerating }
WARequestHandler >> parentChildPairsDo: aTwoArgumentBlock [
	"Evaluate the given two argument block for all the direct parent-child handler pairs in the handler chain up the receiver."
	self parent isNil ifFalse: [
		self parent parentChildPairsDo: aTwoArgumentBlock.
		aTwoArgumentBlock value: self parent value: self ]
]

{ #category : #copying }
WARequestHandler >> postCopy [
	super postCopy.
	filter := filter copy.
	self setFilter: (self filter copyTo: self).
	configuration := configuration copy.
	parent := nil
]

{ #category : #configuration }
WARequestHandler >> preferenceAt: aSymbol [
	^ self configuration at: aSymbol
]

{ #category : #configuration }
WARequestHandler >> preferenceAt: aSymbol ifAbsent: aBlock [
	^ self configuration at: aSymbol ifAbsent: aBlock
]

{ #category : #configuration }
WARequestHandler >> preferenceAt: aSymbol put: anObject [
	anObject isNil
		ifTrue: [ self configuration removeExpressionAt: aSymbol ]
		ifFalse: [ self configuration at: aSymbol put: anObject ].
	
	^ anObject
]

{ #category : #filters }
WARequestHandler >> removeFilter: aFilter [
	"Remove aFilter from the receiver. Answer the removed filter or nil."

	| previous current |
	previous := nil.
	current := self filter.
	[ current = self ] whileFalse: [
		current = aFilter ifTrue: [
			previous isNil
				ifTrue: [ self setFilter: current next ]
				ifFalse: [ previous setNext: current next ].
			^ aFilter setNext: nil ].
		previous := current.
		current := current next ].
	^ nil
]

{ #category : #configuration }
WARequestHandler >> responseGenerator [
	^ (self preferenceAt: #responseGenerator) value
]

{ #category : #configuration }
WARequestHandler >> scriptGeneratorClass [
	^ (self preferenceAt: #scriptGeneratorClass) value
]

{ #category : #configuration }
WARequestHandler >> scriptGeneratorClass: aClass [
	self preferenceAt: #scriptGeneratorClass put: (GRPlatform current bindingOf: aClass)
]

{ #category : #configuration }
WARequestHandler >> serverHostname [
	^ self preferenceAt: #serverHostname
]

{ #category : #configuration }
WARequestHandler >> serverHostname: aString [
	self preferenceAt: #serverHostname put: aString
]

{ #category : #configuration }
WARequestHandler >> serverPath [
	^ self preferenceAt: #serverPath
]

{ #category : #configuration }
WARequestHandler >> serverPath: aString [
	self preferenceAt: #serverPath put: aString
]

{ #category : #configuration }
WARequestHandler >> serverPort [
	^ self preferenceAt: #serverPort
]

{ #category : #configuration }
WARequestHandler >> serverPort: anInteger [
	self preferenceAt: #serverPort put: anInteger
]

{ #category : #configuration }
WARequestHandler >> serverProtocol [
	^ self preferenceAt: #serverProtocol
]

{ #category : #configuration }
WARequestHandler >> serverProtocol: aSymbol [
	self preferenceAt: #serverProtocol put: aSymbol
]

{ #category : #'private-accessing' }
WARequestHandler >> setFilter: aFilter [
	filter contents: aFilter
]

{ #category : #'parent/child' }
WARequestHandler >> setParent: aRequestHandler [
	parent notNil ifTrue: [ parent unregister: self ].
	parent := aRequestHandler
]

{ #category : #'parent/child' }
WARequestHandler >> unregister [
	"Unregister this request handler from its parent handler."
	
	parent notNil ifTrue: [ parent unregister: self ]
]

{ #category : #'parent/child' }
WARequestHandler >> unregister: aRequestHandler [
	"Request handlers that act as containers should implement this method to
	remove aRequestHandler from their collections and send #unregistered to
	aRequestHandler. This method is also called by #setParent:."
]

{ #category : #'parent/child' }
WARequestHandler >> unregistered [
	"This method is called to notify a RequestHandler that it has been removed
	from its container. Subclasses should override to perfrom cleanup actions."
	parent := nil
]

{ #category : #accessing }
WARequestHandler >> url [
	| url |
	
	url := self basicUrl.
	self serverPath isNil ifFalse: [ url parsePath: self serverPath ].
	self serverProtocol isNil ifFalse: [ url scheme: self serverProtocol ].
	self serverHostname isNil ifFalse: [ url host: self serverHostname ].
	self serverPort isNil ifFalse: [ url port: self serverPort ].

	^ url
]

{ #category : #accessing }
WARequestHandler >> urlFor: aRequestHandler [
	"Return the URL for the given request handler, which should be a
	child of the receiver. The default implementation simply returns the
	receiver's URL, but subclasses should override to add a relevant
	parameter or path segment that identifies the particular chid."

	^ self url
]

{ #category : #authentication }
WARequestHandler >> verifyPassword: password forUser: username [ 
	"This method is called by WAAuthMain to verify the username provided
	in the HTTP request. The default implementation compares them against
	the configuration values provided by WAAuthConfiguration. WAAuthMain
	can also be used by itself if you implement this method in your
	own Application subclass to do something different."
	| loginPreference hashPreference |
	loginPreference := self preferenceAt: #login.
	hashPreference := self preferenceAt: #passwordHash.
	loginPreference isNil ifTrue: [
		self authConfigurationError: 'Login not defined. The default authentication method requires a WAAuthConfiguration' ].
	hashPreference isNil ifTrue: [
		self authConfigurationError: 'Password not defined. The default authentication method requires a WAAuthConfiguration' ].
	^ username isEmptyOrNil not
		and: [ password isEmptyOrNil not
		and: [ loginPreference = username
		and: [ hashPreference = (GRPlatform current secureHashFor: password) ] ] ]
]

{ #category : #'parent/child' }
WARequestHandler >> withDescendantsDo: aBlock [
	"Evaluate aBlock for this request handler and recursively for each of
	its child handlers."
	
	aBlock value: self.
	self childrenDo: [ :each | each withDescendantsDo: aBlock ]
]
