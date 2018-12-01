"
Radio buttons work like checkboxes. The difference is that radio buttons, when sharing a single control name, are exclusive. This means that only one of those radio buttons can be checked, and when it's checked, the rest are automatically unchecked.

Radio buttons must be created through a radio group. The callback is only called for the selected option.

| group |
group := html radioGroup.
group radioButton
	selected: aBoolean;
	callback: [ self someThing ]
"
Class {
	#name : #WARadioButtonTag,
	#superclass : #WAFormInputTag,
	#instVars : [
		'group'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WARadioButtonTag >> beChecked [
	self selected: true
]

{ #category : #attributes }
WARadioButtonTag >> beUnchecked [
	self selected: false
]

{ #category : #callbacks }
WARadioButtonTag >> callback: aBlock [
	"Only called if option was selected."
	
	self attributes at: 'value' put: (self storeCallback: (WAValueCallback on: aBlock))
]

{ #category : #attributes }
WARadioButtonTag >> checked: aBoolean [
	self attributes 
		at: 'checked'
		put: aBoolean
]

{ #category : #accessing }
WARadioButtonTag >> group [
	^ group
]

{ #category : #accessing }
WARadioButtonTag >> group: aRadioGroup [
	self name: aRadioGroup key.
	group := aRadioGroup
]

{ #category : #attributes }
WARadioButtonTag >> selected: aBoolean [ 
	self checked: aBoolean
]

{ #category : #accessing }
WARadioButtonTag >> type [
	^ 'radio'
]

{ #category : #attributes }
WARadioButtonTag >> value: anObject [
	group isNil
		ifTrue: [ ^ super value: anObject ].
	group hasSelection 
		ifTrue: [ self selected: (group isSelected: anObject) ].
	group hasCallback 
		ifTrue: [ super value: (group callbackValue: anObject) ]
]
