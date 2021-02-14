"
I represent a continuation as part of the flow of pages within a session. I am not a real continuation (as compared to those used in #call: and #answer:), I only represent a specific point in the session. I reference the root component and a memory snapshot of backtracked objects.
"
Class {
	#name : #WASessionContinuation,
	#superclass : #WARequestHandler,
	#instVars : [
		'states'
	],
	#category : 'Seaside-Session'
}

{ #category : #private }
WASessionContinuation class >> defaultSnapshot [
	^ WASnapshot new
]

{ #category : #testing }
WASessionContinuation class >> isAbstract [
	^ self name = #WASessionContinuation
]

{ #category : #'instance creation' }
WASessionContinuation class >> new [
	^ self snapshot: self defaultSnapshot
]

{ #category : #'instance creation' }
WASessionContinuation class >> snapshot: aSnapshot [
	^ self basicNew
		initializeWithSnapshot: aSnapshot;
		yourself
]

{ #category : #processing }
WASessionContinuation >> captureState [
	"self states reset"
	"Setting states to nil matches the behaviour of Seaside 2.8. Resetting the Snapshot
	is useful for JS callbacks in that refreshing the page will show the modified state
	but can also result in many ActionPhaseContinuations all sharing the same state
	but with different callbacks, some of which may reference state that is no longer present."
	states := nil.
	self updateStates: self states
]

{ #category : #handling }
WASessionContinuation >> handle: aRequestContext [
	"Resume processing of a request. To ensure valid application state restore all registered states."

	self states restore.
	self withUnregisteredHandlerDo: [ super handle: aRequestContext ]
]

{ #category : #initialization }
WASessionContinuation >> initializeWithSnapshot: aSnapshot [
	self initialize.
	states := aSnapshot
]

{ #category : #private }
WASessionContinuation >> redirectToContinuation: aSessionContinuation [
	self respond: [ :response | response redirectTo: aSessionContinuation registerForUrl ]
]

{ #category : #private }
WASessionContinuation >> registerForUrl [
	^ self registerForUrl: true
]

{ #category : #private }
WASessionContinuation >> registerForUrl: aBoolean [
	| url |
	url := self session actionUrlForContinuation: self.
	aBoolean ifTrue: [ self updateUrl: url ].
	^ url
]

{ #category : #accessing }
WASessionContinuation >> request [
	"Answer the current request object."

	^ self requestContext request
]

{ #category : #processing }
WASessionContinuation >> respond: aBlock [ 
	self requestContext respond: aBlock
]

{ #category : #accessing }
WASessionContinuation >> states [
	^ states ifNil: [ states := WASnapshot new ]
]

{ #category : #updating }
WASessionContinuation >> updateStates: aSnapshot [
	self session updateStates: aSnapshot
]

{ #category : #updating }
WASessionContinuation >> updateUrl: aUrl [
	self session updateUrl: aUrl
]

{ #category : #private }
WASessionContinuation >> withUnregisteredHandlerDo: aBlock [ 
	^ aBlock 
		on: WAUnregisteredHandlerError
		do: [ :err | self requestContext redirectTo: self application url ]
]
