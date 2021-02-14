Class {
	#name : #WAAdmin,
	#superclass : #WAObject,
	#classInstVars : [
		'configuredApplicationDefaults',
		'configuredExceptionHandlingDefaults'
	],
	#category : 'Seaside-Tools-Core'
}

{ #category : #configuration }
WAAdmin class >> applicationDefaults [
	| config |
	config := WASharedConfiguration named: 'Application Defaults'.
	(configuredApplicationDefaults ifNil: [ false ]) ifFalse: [
		self configureApplicationDefaults: config.
		configuredApplicationDefaults := true ].
	^ config
]

{ #category : #configuration }
WAAdmin class >> applicationExceptionHandlingDefaults [
	| config |
	config := WASharedConfiguration named: 'Application Exception Handling Defaults'.
	(configuredExceptionHandlingDefaults ifNil: [ false ]) ifFalse: [
		self configureApplicationExceptionHandlingDefaults: config.
		configuredExceptionHandlingDefaults := true ].
	^ config
]

{ #category : #development }
WAAdmin class >> clearAll [
	self clearDefaultDispatcher.
	self clearConfigurationCaches.
	self clearSessions
]

{ #category : #development }
WAAdmin class >> clearConfigurationCaches [
	WASystemConfiguration clearAllDescriptions.
	self defaultServerManager adaptors do: [ :adaptor |
		adaptor requestHandler withDescendantsDo: [ :handler |
			handler configuration clearSearchContexts ] ]
]

{ #category : #development }
WAAdmin class >> clearDefaultDispatcher [
	WADispatcher resetDefault
]

{ #category : #development }
WAAdmin class >> clearSessions [
	self defaultServerManager adaptors do: [ :adaptor |
		adaptor requestHandler withDescendantsDo: [ :handler |
			handler isApplication ifTrue: [ handler clear ] ] ]
]

{ #category : #initialization }
WAAdmin class >> configureApplicationDefaults: aSharedConfiguration [
	"WARenderLoopConfiguration is added by default because most users will use WASession and the Render Loop."
	(aSharedConfiguration parents includes: WARenderLoopConfiguration instance) ifFalse: [
		aSharedConfiguration addParent: WARenderLoopConfiguration instance ]
]

{ #category : #initialization }
WAAdmin class >> configureApplicationExceptionHandlingDefaults: aSharedConfiguration [
	(aSharedConfiguration parents includes: WAExceptionFilterConfiguration instance) ifFalse: [
		aSharedConfiguration addParent: WAExceptionFilterConfiguration instance ]
]

{ #category : #registration }
WAAdmin class >> configureNewApplication: anApplication [
	| filter |
	anApplication configuration
		removeParent: WAApplicationConfiguration instance; "make the chain slightly cleaner"
		addParent: WARenderLoopConfiguration instance;
		addParent: self applicationDefaults.
		
	filter := WAExceptionFilter new.
	filter configuration addParent: self applicationExceptionHandlingDefaults.
	anApplication addFilter: filter
]

{ #category : #configuration }
WAAdmin class >> defaultDispatcher [
	^ WADispatcher default
]

{ #category : #'server adaptors' }
WAAdmin class >> defaultServerManager [
	"Return the default server manager"
	
	^ WAServerManager default
]

{ #category : #registration }
WAAdmin class >> register: aComponentClass asApplicationAt: aString [
	^ self register: aComponentClass asApplicationAt: aString in: self defaultDispatcher
]

{ #category : #registration }
WAAdmin class >> register: aComponentClass asApplicationAt: aString in: aDispatcher [
	"Use this to programmatically register a component as an application."
	| application |
	application := self register: WAApplication at: aString in: aDispatcher.
	self configureNewApplication: application.
	application rootClass: aComponentClass.
	^ application
]

{ #category : #registration }
WAAdmin class >> register: aComponentClass asApplicationAt: aString user: user password: password [ 
	"Like #register:asApplicationAt: but additionally adds password protection."
	| application |
	application := self 
		register: aComponentClass
		asApplicationAt: aString.
	application configuration addParent: WAAuthConfiguration instance.
	application 
		preferenceAt: #login
		put: user.
	application 
		preferenceAt: #passwordHash
		put: (GRPlatform current secureHashFor: password).
	application addFilter: WAAuthenticationFilter new.
	^ application
]

{ #category : #registration }
WAAdmin class >> register: anEntryPointClass at: aString [
	^ self register: anEntryPointClass at: aString in: self defaultDispatcher
]

{ #category : #registration }
WAAdmin class >> register: aRequestHandlerClass at: aString in: aDispatcher [
	| dispatcher subStrings |
	dispatcher := aDispatcher.
	subStrings := GRPlatform subStringsIn: aString splitBy: $/.
	subStrings allButLast do: [ :each |
		dispatcher := dispatcher handlers 
				at: each
				ifAbsent: [ dispatcher register: WADispatcher new at: each ] ].
	^ dispatcher register: aRequestHandlerClass new at: subStrings last
]

{ #category : #'server adaptors' }
WAAdmin class >> serverAdaptors [
	"Return a collection of Server Adaptors that are currently registered in the default Server Manager."
	^ self defaultServerManager adaptors
]

{ #category : #registration }
WAAdmin class >> unregister: aString [
	"Unregister the application aString in the default dispatcher."

	^ self unregister: aString in: self defaultDispatcher
]

{ #category : #registration }
WAAdmin class >> unregister: aString in: aDispatcher [
	"Unregister the application aString in aDispatcher."

	| dispatcher |
	dispatcher := aDispatcher.
	GRPlatform subStringsIn: aString splitBy: $/ do: [ :each |
		dispatcher := dispatcher handlers
				at: each
				ifAbsent: [ ^ nil ] ].
	^ dispatcher parent
		unregister: dispatcher
]
