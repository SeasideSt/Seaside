"
Root class of all elements inside a <head> section.
"
Class {
	#name : #WAHtmlElement,
	#superclass : #WAObject,
	#instVars : [
		'root',
		'attributes',
		'children'
	],
	#category : 'Seaside-Core-Document-Elements'
}

{ #category : #'instance creation' }
WAHtmlElement class >> root: aRoot [
	^ self basicNew initializeWithRoot: aRoot; yourself
]

{ #category : #'accessing-children' }
WAHtmlElement >> add: anElement [
	children ifNil: [ children := OrderedCollection new ].
	children add: anElement
]

{ #category : #'accessing-attributes' }
WAHtmlElement >> attributeAt: aString [
	^ self attributes at: aString
]

{ #category : #'accessing-attributes' }
WAHtmlElement >> attributeAt: aString ifAbsent: aBlock [
	^ self attributes at: aString ifAbsent: aBlock
]

{ #category : #'accessing-attributes' }
WAHtmlElement >> attributeAt: aString put: anObject [
	^ self attributes at: aString put: anObject
]

{ #category : #accessing }
WAHtmlElement >> attributes [
	^ attributes ifNil: [ attributes := WAHtmlAttributes new ]
]

{ #category : #'accessing-children' }
WAHtmlElement >> childrenDo: aBlock [
	children isNil
		ifFalse: [ children do: aBlock ]
]

{ #category : #printing }
WAHtmlElement >> encodeAfterOn: aDocument [
	aDocument closeTag: self tag
]

{ #category : #printing }
WAHtmlElement >> encodeBeforeOn: aDocument [
	aDocument openTag: self tag attributes: attributes closed: self isClosed
]

{ #category : #printing }
WAHtmlElement >> encodeChildrenOn: aDocument [
	self childrenDo: [ :each | each encodeOn: aDocument ]
]

{ #category : #printing }
WAHtmlElement >> encodeOn: aDocument [
	self encodeBeforeOn: aDocument.
	self isClosed ifTrue: [ ^ self ].
	self encodeChildrenOn: aDocument.
	self encodeAfterOn: aDocument
]

{ #category : #initialization }
WAHtmlElement >> initializeWithRoot: aRoot [
	self initialize.
	root := aRoot
]

{ #category : #testing }
WAHtmlElement >> isClosed [
	^ true
]

{ #category : #accessing }
WAHtmlElement >> tag [
	self subclassResponsibility
]

{ #category : #public }
WAHtmlElement >> with: anObject [
	self add: anObject
]
