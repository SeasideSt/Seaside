"
This element allows the use to select one (in single selection mode) or multiple (in single selection mode) elements. Multiple selection can be triggered with #beMultiple, single selection can be triggered with #beSingle .Default is single selection.

The general idea is that you pass the collection of options to #list: and use #labels: to customize their rendering. The selected option(s) can be set with: #selected:.


This whole class is kind of an awkward hack, but nobody needs MI anyway. You can always get a way with composition and delegation
"
Class {
	#name : #WACollectionTag,
	#superclass : #WATagBrush,
	#instVars : [
		'list',
		'selected',
		'labelBlock'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #adding }
WACollectionTag >> add: anObject [
	self list add: anObject
]

{ #category : #adding }
WACollectionTag >> addAll: aCollection [
	self list addAll: aCollection
]

{ #category : #private }
WACollectionTag >> before [
	super before.
	self hasList ifTrue: [
		self list do: [ :each |
			self
				renderListItem: each
				labelled: (self labelForOption: each) ] ]
]

{ #category : #callbacks }
WACollectionTag >> callback: aBlock [
	self subclassResponsibility
]

{ #category : #testing }
WACollectionTag >> hasList [
	^ list notNil and: [ list notEmpty ]
]

{ #category : #testing }
WACollectionTag >> isSelected: anObject [
	"Test if anObject is currently selected."

 	^ selected = anObject
]

{ #category : #private }
WACollectionTag >> labelForOption: anObject [
	^ labelBlock isNil
		ifTrue: [ anObject ]
		ifFalse: [ labelBlock value: anObject ]
]

{ #category : #callbacks }
WACollectionTag >> labels: aBlock [
	"Allows to customize the rendering of list items by passing a one argument block that converts each option to a string. If you need to do custom html rendering for the options use #with: or override #renderOn: in your objects."

	labelBlock := aBlock fixCallbackTemps
]

{ #category : #accessing }
WACollectionTag >> list [
	^ list ifNil: [ list := OrderedCollection new ]
]

{ #category : #accessing }
WACollectionTag >> list: aCollection [
	"Append aCollection of items to display. The rendering can be customized using #labels:."

	aCollection isNil
		ifFalse: [ self addAll: aCollection ]
]

{ #category : #callbacks }
WACollectionTag >> on: aSelector of: anObject [ 
	self selected: (anObject perform: aSelector).
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSelector asMutator)
]

{ #category : #private }
WACollectionTag >> renderListItem: anObject labelled: aString [
	self subclassResponsibility
]

{ #category : #accessing }
WACollectionTag >> selected: anObject [
	"Set anObject to be selected."

	selected := anObject
]
