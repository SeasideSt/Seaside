"
I am the component that represents a single TODO line in the TODO application example
"
Class {
	#name : 'WATodoItem',
	#superclass : 'WAComponent',
	#instVars : [
		'todos',
		'description',
		'done'
	],
	#category : 'Seaside-Examples-Misc',
	#package : 'Seaside-Examples',
	#tag : 'Misc'
}

{ #category : 'instance creation' }
WATodoItem class >> newWithDescription: aString in: aCollection [
	^ self basicNew initializeWithDescription: aString in: aCollection
]

{ #category : 'accessing' }
WATodoItem >> description [
	^ description
]

{ #category : 'accessing' }
WATodoItem >> description: anObject [
	description := anObject
]

{ #category : 'accessing' }
WATodoItem >> done [
	^ done
]

{ #category : 'accessing' }
WATodoItem >> done: anObject [
	done := anObject
]

{ #category : 'initialization' }
WATodoItem >> initializeWithDescription: aString in: aCollection [

	self initialize.
	self done: false.
	self description: aString.
	todos := aCollection
]

{ #category : 'private' }
WATodoItem >> remove [
	todos remove: self
]

{ #category : 'rendering' }
WATodoItem >> renderContentOn: html [
	
	html listItem
		onDoubleClick: (html javascript callback: [ self call: (WATodoItemEditor on: self) ]);
		with:[ 
			html form
				class: 'view';
				with:[
					html checkbox
						class: 'toggle';
						onChange: (JSStream on: 'this.form.requestSubmit()');
						callback: [ :value | self done: value ];
						value: done.
					html label: description.
					html button
						callback: [ self remove ];
						class: 'destroy' ] ]
]
