Class {
	#name : 'WATurboTodoItemEditor',
	#superclass : 'WAComponent',
	#instVars : [
		'todoItem'
	],
	#category : 'Seaside-HotwireTurbo-Examples',
	#package : 'Seaside-HotwireTurbo-Examples'
}

{ #category : 'instance creation' }
WATurboTodoItemEditor class >> on: aWATodoItem [

	^ self basicNew initializeOn: aWATodoItem
]

{ #category : 'initialization' }
WATurboTodoItemEditor >> initializeOn: aWATodoItem [

	self initialize.
	todoItem := aWATodoItem
]

{ #category : 'rendering' }
WATurboTodoItemEditor >> renderContentOn: html [

	html form: [
		html textInput
			class: 'edit';
			callback: [ :value | todoItem description: value ];
			value: todoItem description.
		html submitButton
			style: 'display:none';
			callback: [ self answer ] ]
]
