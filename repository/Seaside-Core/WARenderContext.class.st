"
A WARenderContext provides all the state needed by a Renderer to do its work.

It is a decoupling device between whatever is initiating rendering and the Renderer itself.
"
Class {
	#name : #WARenderContext,
	#superclass : #WAObject,
	#instVars : [
		'visitor',
		'actionUrl',
		'actionBaseUrl',
		'resourceUrl',
		'callbacks',
		'document',
		'properties'
	],
	#category : 'Seaside-Core-Rendering'
}

{ #category : #accessing }
WARenderContext >> absoluteUrlForResource: aString [ 
	| url |
	aString isNil ifTrue: [ ^ nil ].
	url := self resourceUrl.
	(url isNil or: [ (aString indexOfSubCollection: '://' startingAt: 1) ~= 0 ]) ifTrue: [
		^ WAUrl absolute: aString ].
	^ url copy addToPath: aString; yourself
]

{ #category : #accessing }
WARenderContext >> actionBaseUrl [
	"Answer the action URL, that was not modified by #updateUrl:."
	
	^ actionBaseUrl
]

{ #category : #accessing }
WARenderContext >> actionBaseUrl: anObject [
	actionBaseUrl := anObject seasideUrl
]

{ #category : #accessing }
WARenderContext >> actionUrl [
	"Answer the action URL that was modified by #updateUrl:."

	^ actionUrl
]

{ #category : #accessing }
WARenderContext >> actionUrl: anObject [
	actionUrl := anObject seasideUrl
]

{ #category : #callbacks }
WARenderContext >> callbackAt: aString [
	self greaseDeprecatedApi: 'WARenderContext>>#callbackAt:' details: 'Report if you still need it.'.
	^ callbacks at: aString ifAbsent: [ ]
]

{ #category : #accessing }
WARenderContext >> callbacks [
	^ callbacks
]

{ #category : #private }
WARenderContext >> defaultVisitor [
	^ WARenderVisitor context: self
]

{ #category : #initialization }
WARenderContext >> destroy [
	self document destroy.
	document := nil
]

{ #category : #accessing }
WARenderContext >> document [
	"Answer the value of document"

	^ document
]

{ #category : #accessing }
WARenderContext >> document: anObject [
	"Set the value of document"

	document := anObject
]

{ #category : #accessing }
WARenderContext >> document: aDocument during: aBlock [
	"Set the value of document for the duration of aBlock"
	| previous |
	previous := document.
	[ document := aDocument.
	aBlock value ]
		ensure: [ document := previous ]
]

{ #category : #initialization }
WARenderContext >> initialize [
	super initialize.
	callbacks := WACallbackRegistry new
]

{ #category : #copying }
WARenderContext >> postCopy [
	super postCopy.
	visitor := visitor copyForRenderContext: self.
	actionUrl := actionUrl copy.
	resourceUrl := resourceUrl copy.
	properties := properties copy
]

{ #category : #accessing }
WARenderContext >> properties [
	"Answer a property dictionary."
	^ properties ifNil: [ properties := GRSmallDictionary2 new ]
]

{ #category : #accessing }
WARenderContext >> resourceUrl [
	^ resourceUrl
]

{ #category : #accessing }
WARenderContext >> resourceUrl: anObject [
	resourceUrl := anObject seasideUrl
]

{ #category : #accessing }
WARenderContext >> visitor [
	^ visitor ifNil: [ visitor := self defaultVisitor ]
]

{ #category : #accessing }
WARenderContext >> visitor: anObject [
	visitor := anObject
]
