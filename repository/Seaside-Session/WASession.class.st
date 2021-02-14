"
I am a Seaside session. A new instance of me gets created when an user accesses an application for the first time and is persistent as long as the user is interacting with it.

This class is intended to be subclasses by applications that need global state, like a user. Custom state can be added by creating instance variables and storing it there. The session can be retrieved by #session if inside a component or task or by evaluating: WACurrentRequestContext session

If the session has not been used for #defaultTimeoutSeconds, it is garbage collected by the system. To manually expire a session call #expire.

A good way to clear all sessions is the following code:

WARegistry clearAllHandlers.
WAPlatform current garbageCollect
"
Class {
	#name : #WASession,
	#superclass : #WARequestHandler,
	#instVars : [
		'continuations',
		'properties',
		'documentHandlers',
		'key'
	],
	#category : 'Seaside-Session'
}

{ #category : #accessing }
WASession >> actionField [
	^ '_k'
]

{ #category : #accessing }
WASession >> actionUrlForContinuation: aContinuation [
	^ self actionUrlForKey: (continuations store: (aContinuation setParent: self; yourself))
]

{ #category : #accessing }
WASession >> actionUrlForKey: aString [
	^ self url
		addField: self actionField value: aString;
		yourself
]

{ #category : #accessing }
WASession >> application [
	^ self parent
]

{ #category : #private }
WASession >> basicUrl [
	| url |
	url := self parent url.
	self parent trackingStrategy addKey: key toUrl: url.
	^ url
]

{ #category : #initialization }
WASession >> createContinuationCache [
	"To configure the continuation cache you must currently subclass WASession and
	override this method.
	There is no need to use WABulkReapingCache for GemStone/S here because we're inside the session mutex."
	^ WAHashCache
		initialSize: 7
		maximumSize: 20
		maximumAbsoluteAge: 0
		maximumRelativeAge: 0
		overflowAction: WAHashCache removeRelativeOldest
]

{ #category : #initialization }
WASession >> createDocumentHandlerCache [
	"No mutex necessary since we are inside the session mutex.
	We don't expire document handlers"
	^ WAUnidirectionalCache new
]

{ #category : #private }
WASession >> documentHandlerFieldName [
	^ '_d'
]

{ #category : #accessing }
WASession >> documentHandlers [
	documentHandlers isNil ifTrue: [
		documentHandlers := self createDocumentHandlerCache ].
	^ documentHandlers
]

{ #category : #accessing }
WASession >> documentHandlers: aCache [
	documentHandlers := aCache
]

{ #category : #handling }
WASession >> handleFiltered: aRequestContext [
	| continationKey continuation fields documentHandlerKey |
	fields := aRequestContext request fields.
	documentHandlerKey := fields at: self documentHandlerFieldName ifAbsent: [ nil ].
	documentHandlerKey isNil ifFalse: [
		| documentHandler |
		documentHandler := self documentHandlers at: documentHandlerKey ifAbsent: [ 
			^ aRequestContext responseGenerator
				notFound;
				respond ].
		^ documentHandler handle: aRequestContext ].
	
	continationKey := fields
		at: self actionField
		ifAbsent: [ ^ self start ].
		
	continuation := continuations
		at: continationKey
		ifAbsent: [ ^ self unknownRequest ].
	continuation handle: aRequestContext
]

{ #category : #initialization }
WASession >> initialize [
	super initialize.
	self initializeFilters.
	continuations := self createContinuationCache
]

{ #category : #initialization }
WASession >> initializeFilters [
	self addFilter: (GRPlatform current createMutualExclusionFilter)
]

{ #category : #testing }
WASession >> isSession [
	^ true
]

{ #category : #scripts }
WASession >> jumpToAnchor: aString [
	| actionContinuation |
	actionContinuation := self requestContext handlers
		detect: [ :each | each isActionContinuation ]
		ifNone: [ WAIllegalStateException signal: 'You can only send #jumpToAnchor: from within a callback' ].
	actionContinuation jumpToAnchor: aString
]

{ #category : #accessing }
WASession >> key [
	^ key
]

{ #category : #accessing }
WASession >> key: aString [
	key := aString
]

{ #category : #copying }
WASession >> postCopy [
	super postCopy.
	continuations := continuations copy
]

{ #category : #accessing }
WASession >> properties [
	"Answer a dictionary of session-related properties."
	^ properties ifNil: [ properties := GRSmallDictionary2 new ]
]

{ #category : #'parent/child' }
WASession >> register: aDocumentHandler [
	| handlerKey |
	handlerKey := self documentHandlers store: (aDocumentHandler setParent: self; yourself).
	^ self basicUrl
		addField: self documentHandlerFieldName value: handlerKey;
		yourself
]

{ #category : #handling }
WASession >> start [
	self application initialContinuationClass new handle: self requestContext
]

{ #category : #handling }
WASession >> unknownRequest [
	^ self start
]

{ #category : #'parent/child' }
WASession >> unregister [
	parent unregisterAt: key
]

{ #category : #updating }
WASession >> updateRoot: anHtmlRoot [
]

{ #category : #updating }
WASession >> updateStates: aSnapshot [
	self filters do: [ :each | each updateStates: aSnapshot ].
	aSnapshot register: filter
]

{ #category : #updating }
WASession >> updateUrl: aUrl [
]
