"
A WARadioGroup is a container for several related radio buttons. It must be used to create radio buttons.

Example:
| group |
group := html radioGroup.
group radioButton
	selected: aBoolean;
	callback: [ self someThing ].

"
Class {
	#name : #WARadioGroup,
	#superclass : #WAObject,
	#instVars : [
		'canvas',
		'key',
		'values',
		'selected'
	],
	#category : 'Seaside-Canvas-Base'
}

{ #category : #accessing }
WARadioGroup class >> canvas: aRenderCanvas [
	^ self basicNew initializeWithCanvas: aRenderCanvas
]

{ #category : #private }
WARadioGroup >> callback: aBlock [
	values := Dictionary new.
	key := canvas callbacks store: (WAValuesCallback on: aBlock values: values)
]

{ #category : #private }
WARadioGroup >> callbackValue: anObject [
	^ self valuesAt: values size + 1 put: anObject
]

{ #category : #private }
WARadioGroup >> hasCallback [
	^ values notNil
]

{ #category : #testing }
WARadioGroup >> hasSelection [
 	^ selected notNil
]

{ #category : #initialization }
WARadioGroup >> initializeWithCanvas: aRenderCanvas [
	self initialize.
	canvas := aRenderCanvas
]

{ #category : #testing }
WARadioGroup >> isSelected: anObject [
	"Test if anObject is currently selected."

 	^ selected = anObject
]

{ #category : #accessing }
WARadioGroup >> key [
	^ key ifNil: [ key := canvas callbacks store: WADispatchCallback new ]
]

{ #category : #'public api' }
WARadioGroup >> radioButton [
	^ canvas radioButton group: self
]

{ #category : #accessing }
WARadioGroup >> selected: anObject [
	"Set anObject to be selected."

	selected := anObject
]

{ #category : #private }
WARadioGroup >> valuesAt: aKey put: anObject [
	values at: aKey put: anObject.
	^ values size
]

{ #category : #'public api' }
WARadioGroup >> with: aBlock [
	^ aBlock value: self
]
