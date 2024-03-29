Class {
	#name : 'WATurboTodoItem',
	#superclass : 'WAComponent',
	#instVars : [
		'todos',
		'description',
		'done',
		'editmode'
	],
	#category : 'Seaside-HotwireTurbo-Examples',
	#package : 'Seaside-HotwireTurbo-Examples'
}

{ #category : 'instance creation' }
WATurboTodoItem class >> newWithDescription: aString in: aCollection [
	^ self new initializeWithDescription: aString in: aCollection
]

{ #category : 'accessing' }
WATurboTodoItem >> description [
	^ description
]

{ #category : 'accessing' }
WATurboTodoItem >> description: anObject [
	description := anObject
]

{ #category : 'accessing' }
WATurboTodoItem >> done [
	^ done
]

{ #category : 'accessing' }
WATurboTodoItem >> done: anObject [
	done := anObject
]

{ #category : 'initialization' }
WATurboTodoItem >> initializeWithDescription: aString in: aCollection [
	self initialize.
	self done: false.
	self description: aString.
	editmode := false.
	todos := aCollection
]

{ #category : 'private' }
WATurboTodoItem >> remove [

	todos remove: self
]

{ #category : 'rendering' }
WATurboTodoItem >> renderCheckBoxIn: id on: html [

	html form
		turboStreamCallback: [ :ts | ts update: id with: self ];
		with: [ 
			html checkbox
				class: 'toggle';
				callback: [ :value | self done: value ];
				onChange: (html javascript: 'this.form.requestSubmit()');
				value: done ]
]

{ #category : 'rendering' }
WATurboTodoItem >> renderContentOn: html [

	| id |
	html listItem
		id: (id := html nextId);
		onDoubleClick: (html javascript turboCallback: [ self turboCall: (WATurboTodoItemEditor on: self) ]);
		with: [ 
			html div
				class: 'view';
				with:[
					self renderCheckBoxIn: id on: html.
					self renderDescriptionOn: html.
					self renderDestroyerOn: html ] ]
]

{ #category : 'rendering' }
WATurboTodoItem >> renderDescriptionOn: html [

	html label: description.
	html anchor
		class: 'edit-link';
		callback: [ self turboCall: (WATurboTodoItemEditor on: self) ];
		with: 'edit'
]

{ #category : 'rendering' }
WATurboTodoItem >> renderDestroyerOn: html [

	html form: [ 
		html button
			class: 'destroy';
			turboStreamCallback: [ :ts | self remove. ts removeComponent: self ] ]
]
