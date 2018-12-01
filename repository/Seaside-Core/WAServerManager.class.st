Class {
	#name : #WAServerManager,
	#superclass : #WAObject,
	#instVars : [
		'adaptors'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-Core-Server'
}

{ #category : #accessing }
WAServerManager class >> default [
	default contents ifNil: [ default contents: self new ].
	^ default contents
]

{ #category : #'class initialization' }
WAServerManager class >> initialize [
	self initializeDefaultValueHolder.
	GRPlatform current
		addToStartUpList: self;
		addToShutDownList: self
]

{ #category : #'class initialization' }
WAServerManager class >> initializeDefaultValueHolder [
	default isNil ifTrue: [ 
		default := GRPlatform current newTransientValueHolder ]
]

{ #category : #'system startup' }
WAServerManager class >> shutDown [
	self default adaptors do: [ :each | each shutDown ]
]

{ #category : #'system startup' }
WAServerManager class >> startUp [
	self default adaptors do: [ :each | each startUp ]
]

{ #category : #'class initialization' }
WAServerManager class >> unload [
	GRPlatform current
		removeFromStartUpList: self;
		removeFromShutDownList: self
]

{ #category : #accessing }
WAServerManager >> adaptors [
	^ adaptors copy
]

{ #category : #private }
WAServerManager >> canStart: aServerAdaptor [
	"Because we can't rely on the socket refusing to listen on a port already in use, we simply check here if we know of another adaptor using this adaptor's port"
	^ aServerAdaptor isStopped 
			and: [ self adaptors noneSatisfy: [ :adaptor | 
				adaptor ~= aServerAdaptor
					and: [ adaptor port = aServerAdaptor port
					and: [ adaptor isStopped not ] ] ] ]
]

{ #category : #private }
WAServerManager >> canStop: aServerAdaptor [
	^ aServerAdaptor isStopped not
]

{ #category : #initialization }
WAServerManager >> initialize [
	super initialize.
	adaptors := OrderedCollection new
]

{ #category : #accessing }
WAServerManager >> register: aServerAdaptor [
	^ adaptors add: aServerAdaptor
]

{ #category : #'starting/stopping' }
WAServerManager >> restart: aServerAdaptor [
	self stop: aServerAdaptor.
	self start: aServerAdaptor
]

{ #category : #'starting/stopping' }
WAServerManager >> restartAll [
	adaptors do: [ :each | each restart ]
]

{ #category : #'starting/stopping' }
WAServerManager >> start: aServerAdaptor [
	(self canStart: aServerAdaptor) ifTrue: [
		[ aServerAdaptor basicStart ]
			ifCurtailed: [ self stop: aServerAdaptor ] ]
]

{ #category : #'starting/stopping' }
WAServerManager >> startAll [
	adaptors do: [ :each | each start ]
]

{ #category : #'starting/stopping' }
WAServerManager >> stop: aServerAdaptor [
	(self canStop: aServerAdaptor) ifTrue: [ aServerAdaptor basicStop ]
]

{ #category : #'starting/stopping' }
WAServerManager >> stopAll [
	adaptors do: [ :each | each stop ]
]

{ #category : #accessing }
WAServerManager >> unregister: aServerAdaptor [
	self stop: aServerAdaptor.
	adaptors remove: aServerAdaptor.
	aServerAdaptor unregistered.
	^ aServerAdaptor
]
