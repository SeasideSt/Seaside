"
The command element represents a command that the user can invoke.
"
Class {
	#name : #WACommandTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WACommandTag >> beCheckbox [
	self type: 'checkbox'
]

{ #category : #attributes }
WACommandTag >> beChecked [
	self checked: true
]

{ #category : #attributes }
WACommandTag >> beCommand [
	self type: 'command'
]

{ #category : #attributes }
WACommandTag >> beDisabled [
	self disabled: true
]

{ #category : #attributes }
WACommandTag >> beHidden [
	self hidden: true
]

{ #category : #attributes }
WACommandTag >> beRadio [
	self type: 'radio'
]

{ #category : #attributes }
WACommandTag >> checked: aBoolean [
	"The checked attribute is a boolean attribute that, if present, indicates that the command is selected."
	self attributeAt: 'checked' put: aBoolean
]

{ #category : #attributes }
WACommandTag >> disabled: aBoolean [
	"The disabled attribute is a boolean attribute that, if present, indicates that the command is not available in the current state."
	self attributeAt: 'disabled' put: aBoolean
]

{ #category : #attributes }
WACommandTag >> hidden: aBoolean [
	"The hidden  attribute is a boolean attribute that, if present, indicates that the command is not relevant and is to be hidden."
	self attributeAt: 'hidden' put: aBoolean
]

{ #category : #attributes }
WACommandTag >> icon: aString [
	"The icon  attribute gives a picture that represents the command. If the attribute is specified, the attribute's value must contain a URI (or IRI)."
	self attributeAt: 'icon' put: aString
]

{ #category : #attributes }
WACommandTag >> label: aString [
	"The label  attribute gives the name of the command, as shown to the user."
	self attributeAt: 'label' put: aString
]

{ #category : #accessing }
WACommandTag >> tag [
	^ 'command'
]

{ #category : #attributes }
WACommandTag >> type: aString [
	"The type  attribute indicates the kind of command: either a normal command with an associated action, or a state or option that can be toggled, or a selection of one item from a list of items.

The attribute's value must be either 'command', 'checkbox', or 'radio', denoting each of these three types of commands respectively. The attribute may also be omitted if the element is to represent the first of these types, a simple command. "
	self attributeAt: 'type' put: aString
]
