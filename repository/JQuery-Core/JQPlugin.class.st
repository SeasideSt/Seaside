Class {
	#name : #JQPlugin,
	#superclass : #JSObject,
	#instVars : [
		'owner',
		'options'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #'instance creation' }
JQPlugin class >> context: aRenderContext owner: aQuery [
	^ (self context: aRenderContext)
		setOwner: aQuery;
		yourself
]

{ #category : #accessing }
JQPlugin >> arguments [
	^ options isNil
		ifTrue: [ Array new ]
		ifFalse: [ Array with: options ]
]

{ #category : #private }
JQPlugin >> id: aString [
	self owner id: aString
]

{ #category : #private }
JQPlugin >> jQuery [
	^ (JQueryClass context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #printing }
JQPlugin >> javascriptContentOn: aStream [
	aStream
		javascript: self owner;
		nextPut: $.;
		nextPutAll: self method.
	JSStream encodeArguments: self arguments on: aStream
]

{ #category : #accessing }
JQPlugin >> method [
	self subclassResponsibility
]

{ #category : #options }
JQPlugin >> optionAt: aKey put: aValue [
	^ self options at: aKey put: aValue
]

{ #category : #options }
JQPlugin >> options [
	^ options ifNil: [ options := GRSmallDictionary2 new ]
]

{ #category : #accessing }
JQPlugin >> owner [
	^ owner
]

{ #category : #initialization }
JQPlugin >> setOwner: aQuery [
	owner := aQuery
]
