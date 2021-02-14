Class {
	#name : #SUNavigation,
	#superclass : #WAComponent,
	#instVars : [
		'items',
		'uid'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #public }
SUNavigation >> add: anObject [
	"Add anObject to the collection of child items. Answer an instance of SUNavigationItem."

	^ items add: (self navigationItemClass on: self body: anObject)
]

{ #category : #public }
SUNavigation >> add: anObject label: aString [
	^ (self add: anObject) label: aString
]

{ #category : #hooks }
SUNavigation >> children [
	^ self visibleComponentsFor: self visible
]

{ #category : #accessing }
SUNavigation >> cssClass [
	"Answer the css class the outermost DOM element will use."

	self subclassResponsibility
]

{ #category : #private }
SUNavigation >> findIndex: anItem ifAbsent: aBlock [ 
	| index |
	index := items findFirst: [ :each | each = anItem ].
	index isZero ifTrue: [ aBlock value ].
	^ index
]

{ #category : #initialization }
SUNavigation >> initialize [
	super initialize.
	items := OrderedCollection new
]

{ #category : #accessing }
SUNavigation >> navigationItemClass [
	"Answer the navigation class to represent the child items."

	^ SUNavigationItem
]

{ #category : #public }
SUNavigation >> remove: anItem [
	"Remove anItem from the collection of child items."

	^ items remove: anItem ifAbsent: [ nil ]
]

{ #category : #rendering }
SUNavigation >> renderContentOn: html [
	uid := html nextId.
	self renderNavigationOn: html
]

{ #category : #rendering }
SUNavigation >> renderNavigationOn: html [
	self subclassResponsibility
]

{ #category : #private }
SUNavigation >> uid [
	^ uid
]

{ #category : #private }
SUNavigation >> uid: aString at: anInteger [
	^ uid , '_' , aString , '_' , anInteger greaseString
]

{ #category : #accessing }
SUNavigation >> visible [
	"override in subclasses if not all items are displayed, see for example SUTabPanel"

	^ items
]

{ #category : #accessing }
SUNavigation >> visibleComponentsFor: aCollection [
	^ (aCollection select: [ :each | each isComponent ]) collect: [ :each | each body ]
]
