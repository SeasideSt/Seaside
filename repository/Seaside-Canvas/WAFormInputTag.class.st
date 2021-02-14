"
The <input> tag defines the start of an input field where the user can enter data.
"
Class {
	#name : #WAFormInputTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAFormInputTag >> autocomplete: aString [
	"User agents sometimes have features for helping users fill forms in, for example prefilling the user's address based on earlier user input. The autocomplete content attribute can be used to hint to the user agent how to, or indeed whether to, provide such a feature."
	self attributes 
		at: 'autocomplete'
		append: aString
]

{ #category : #callbacks }
WAFormInputTag >> callback: aBlock [
	self name: (self storeCallback: (WAValueCallback on: aBlock))
]

{ #category : #testing }
WAFormInputTag >> isClosed [
	^ true
]

{ #category : #attributes }
WAFormInputTag >> name: aString [
	"This attribute assigns the control name.
	
	A control's 'control name' is given by its name attribute. The scope of the name attribute for a control within a FORM element is the FORM element."
	self attributes at: 'name' put: aString
]

{ #category : #attributes }
WAFormInputTag >> noAutocomplete [
	self autocomplete: 'off'
]

{ #category : #callbacks }
WAFormInputTag >> on: aSelector of: anObject [ 
	self value: (anObject perform: aSelector).
	self callback: (GRDelayedSend 
			receiver: anObject
			selector: aSelector asMutator)
]

{ #category : #attributes }
WAFormInputTag >> readonly: aBoolean [
	"When set to true, this boolean attribute prohibits changes to the widget."
	self attributes at: 'readonly' put: aBoolean
]

{ #category : #attributes }
WAFormInputTag >> size: aNumber [ 
	"This attribute tells the user agent the initial width of the widget. The width is given in pixels except when type attribute has the value 'text' or 'password'. In that case, its value refers to the (integer) number of characters."
	self attributes 
		at: 'size'
		put: aNumber
]

{ #category : #accessing }
WAFormInputTag >> tag [
	^ 'input'
]

{ #category : #attributes }
WAFormInputTag >> text: aString [
	self value: aString
]

{ #category : #accessing }
WAFormInputTag >> type [
	^ nil
]

{ #category : #attributes }
WAFormInputTag >> type: aString [
	self attributes at: 'type' put: aString
]

{ #category : #attributes }
WAFormInputTag >> value [
	^ self attributes at: 'value'
]

{ #category : #attributes }
WAFormInputTag >> value: anObject [
	anObject isNil
		ifFalse: [ self attributes at: 'value' put: anObject ]
]

{ #category : #public }
WAFormInputTag >> with: aBlock [
	self type isNil ifFalse: [
		self attributes at: 'type' ifAbsentPut: [ self type ] ].
	super with: aBlock
]
