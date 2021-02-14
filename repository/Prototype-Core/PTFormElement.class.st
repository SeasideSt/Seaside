"
This is a collection of methods that assist in dealing with form controls. They provide ways to focus, serialize, disable/enable or extract current value from a specific control.
"
Class {
	#name : #PTFormElement,
	#superclass : #PTElement,
	#category : 'Prototype-Core-Elements'
}

{ #category : #actions }
PTFormElement >> activate [
	"Gives focus to a form control and selects its contents if it is a text input."

	self call: 'activate'
]

{ #category : #actions }
PTFormElement >> clear [
	"Clears the contents of a text input."

	self call: 'clear'
]

{ #category : #actions }
PTFormElement >> disable [
	"Disables a form control, effectively preventing its value to be changed until it is enabled again."

	self call: 'disable'
]

{ #category : #actions }
PTFormElement >> enable [
	"Enables a previously disabled form control."

	self call: 'enable'
]

{ #category : #actions }
PTFormElement >> focus [
	"Gives keyboard focus to an element."

	self call: 'focus'
]

{ #category : #querying }
PTFormElement >> present [
	"Returns true if a text input has contents, false otherwise."

	self call: 'present'
]

{ #category : #actions }
PTFormElement >> select [
	"Selects the current text in a text input."

	self call: 'select'
]

{ #category : #querying }
PTFormElement >> serialize [
	"Creates an URL-encoded string representation of a form control in the name=value format."

	self call: 'serialize'
]

{ #category : #querying }
PTFormElement >> value [
	"Returns the current value of a form control. A string is returned for most controls; only multiple select boxes return an array of values. The global shortcut for this method is $F()."

	self call: 'getValue'
]
