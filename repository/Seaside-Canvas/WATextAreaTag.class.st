"
I am a multi line text input widget. See WAInputTest >> #renderTextAreaWithExampleOn: for examples.
"
Class {
	#name : #WATextAreaTag,
	#superclass : #WAAbstractTextAreaTag,
	#instVars : [
		'value'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WATextAreaTag >> columns: anInteger [ 
	"This attribute specifies the visible width in average character widths. User agents may wrap visible text lines to keep long lines visible without the need for scrolling."
	self attributes 
		at: 'cols'
		put: anInteger
]

{ #category : #initialization }
WATextAreaTag >> initialize [
	super initialize.
	self rows: 'auto'; columns: 'auto'
]

{ #category : #testing }
WATextAreaTag >> isClosed [
	^ false
]

{ #category : #attributes }
WATextAreaTag >> rows: anInteger [ 
	"This attribute specifies the number of visible text lines. If more are entered, the widget scrolls."
	self attributes 
		at: 'rows'
		put: anInteger
]

{ #category : #accessing }
WATextAreaTag >> tag [
	^ 'textarea'
]

{ #category : #attributes }
WATextAreaTag >> value [
	^ value
]

{ #category : #attributes }
WATextAreaTag >> value: aString [
	value := aString
]

{ #category : #public }
WATextAreaTag >> with: aBlock [
	super with: (value ifNil: [ aBlock ])
]
