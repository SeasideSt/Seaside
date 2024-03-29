"
I am the component that represents an editable TODO line in the TODO application example
"
Class {
	#name : 'WATodoItemEditor',
	#superclass : 'WAComponent',
	#instVars : [
		'todoItem'
	],
	#category : 'Seaside-Examples-Misc',
	#package : 'Seaside-Examples',
	#tag : 'Misc'
}

{ #category : 'instance creation' }
WATodoItemEditor class >> on: aWATodoItem [

	^ self basicNew initializeOn: aWATodoItem
]

{ #category : 'initialization' }
WATodoItemEditor >> initializeOn: aWATodoItem [

	self initialize.
	todoItem := aWATodoItem
]

{ #category : 'rendering' }
WATodoItemEditor >> renderContentOn: html [

	html form: [
		html textInput
			class: 'edit';
			callback: [ :value | todoItem description: value ];
			value: todoItem description.
		html submitButton
			style: 'display:none';
			callback: [ self answer ] ]
]
