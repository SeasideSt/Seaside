"
A Renderer provides methods for rendering data (typically HTML) onto a Document. It gets all the information needed to do its work from a WARenderContext, which is passed in on initialization.

Renderer are typically controlled by a Painter.
"
Class {
	#name : #WARenderer,
	#superclass : #WAObject,
	#instVars : [
		'context',
		'lastId'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-Core-Rendering'
}

{ #category : #'instance creation' }
WARenderer class >> builder [
	^ WABuilder on: self
]

{ #category : #'instance creation' }
WARenderer class >> context: aRenderContext [
	^ self basicNew initializeWithContext: aRenderContext; yourself
]

{ #category : #defaults }
WARenderer class >> default [
	^ default ifNil: [ default := WARenderer ]
]

{ #category : #defaults }
WARenderer class >> default: anObject [
	default := anObject
]

{ #category : #defaults }
WARenderer class >> resetDefault [
	WARenderer default: nil
]

{ #category : #defaults }
WARenderer class >> selectAsDefault [
	WARenderer default: self
]

{ #category : #defaults }
WARenderer class >> unselectAsDefault [
	(WARenderer default = self) ifTrue: [ WARenderer resetDefault ]
]

{ #category : #public }
WARenderer >> absoluteUrlForResource: aString [
	"Answer a resource URL for aString. The URL will always be absolute (ie. it will begin
	with a / or a URL scheme like http://. If aString already looks like a URL, an instance
	of WAUrl will be returned for it. If it looks like a path, it will be appended to the
	resource base URL configured in the RenderContext if there is one."

	^ self context absoluteUrlForResource: aString
]

{ #category : #public }
WARenderer >> actionBaseUrl [
	^ self context actionBaseUrl
]

{ #category : #public }
WARenderer >> actionUrl [
	^ self context actionUrl
]

{ #category : #accessing }
WARenderer >> callbacks [
	"Answer the callback registry."

	^ self context callbacks
]

{ #category : #accessing }
WARenderer >> context [
	"Answer the rendering context."

	^ context
]

{ #category : #accessing }
WARenderer >> document [
	^ self context document
]

{ #category : #private }
WARenderer >> flush [
	"Close any open elements and write any remaining data."
]

{ #category : #initialization }
WARenderer >> initializeWithContext: aRenderContext [
	self initialize.
	context := aRenderContext
]

{ #category : #public }
WARenderer >> lastId [
	"Answer the last identifier that was generated with #nextId."
	
	^ lastId
]

{ #category : #public }
WARenderer >> nextId [
	"Answer an identifier string that is unique within this WARenderContext."
	
	^ lastId := 'id', self callbacks advanceKey
]

{ #category : #public }
WARenderer >> render: anObject [
	"Render anObject using this Renderer."
	
	anObject renderOn: self
]

{ #category : #public }
WARenderer >> text: anObject [
	"Emit anObject onto the target document."

	self document print: anObject
]

{ #category : #public }
WARenderer >> urlForAction: aBlock [
	"Answer an action URL that will evaluate aBlock when it is requested."

	^ self actionUrl withField: (self callbacks store: (WAActionCallback on: aBlock))
]
