"
Buttons created with the BUTTON element function just like buttons created with the INPUT element, but they offer richer rendering possibilities: the BUTTON element may have content. For example, a BUTTON element that contains an image functions like and may resemble an INPUT element whose type is set to ""image"", but the BUTTON element type allows content.
"
Class {
	#name : #WAButtonTag,
	#superclass : #WAFormInputTag,
	#instVars : [
		'type',
		'value'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #accessing }
WAButtonTag >> bePush [
	"Creates a push button. Push buttons have no default behavior. Each push button may have client-side scripts associated with the element's event attributes. When an event occurs (e.g., the user presses the button, releases it, etc.), the associated script is triggered."
	type := 'button'
]

{ #category : #accessing }
WAButtonTag >> beReset [
	"Creates a reset button. When activated it resets all controls to their initial values."
	type := 'reset'
]

{ #category : #accessing }
WAButtonTag >> beSubmit [
	"Creates a submit button. When activated, a submit button submits a form. A form may contain more than one submit button. This is the default."
	type := 'submit'
]

{ #category : #callbacks }
WAButtonTag >> callback: aNiladicValuable [ 
	aNiladicValuable argumentCount > 0 ifTrue: [ GRInvalidArgumentCount signal: 'Buttons expect a niladic callback.' ].
	self name: (self storeCallback: (WAActionCallback on: aNiladicValuable))
]

{ #category : #initialization }
WAButtonTag >> initialize [
	super initialize.
	self beSubmit
]

{ #category : #testing }
WAButtonTag >> isClosed [
	^ false
]

{ #category : #callbacks }
WAButtonTag >> on: aSymbol of: anObject [ 
	self value: (self 
			labelForSelector: aSymbol
			of: anObject).
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSymbol)
]

{ #category : #accessing }
WAButtonTag >> tag [
	^ 'button'
]

{ #category : #accessing }
WAButtonTag >> type [
	^ type
]

{ #category : #attributes }
WAButtonTag >> value [
	^ value
]

{ #category : #attributes }
WAButtonTag >> value: aString [
	value := aString
]

{ #category : #public }
WAButtonTag >> with: aBlock [
	super with: (value ifNil: [ aBlock ])
]
