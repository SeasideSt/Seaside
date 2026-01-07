Class {
	#name : 'WATodoWithJQueryItem',
	#superclass : 'WAComponent',
	#instVars : [
		'todos',
		'description',
		'done'
	],
	#category : 'JQuery-Examples',
	#package : 'JQuery-Examples'
}

{ #category : 'instance creation' }
WATodoWithJQueryItem class >> newWithDescription: aString in: aCollection [
	^ self new initializeWithDescription: aString in: aCollection
]

{ #category : 'accessing' }
WATodoWithJQueryItem >> description [
	^ description
]

{ #category : 'accessing' }
WATodoWithJQueryItem >> description: anObject [
	description := anObject
]

{ #category : 'accessing' }
WATodoWithJQueryItem >> done [
	^ done
]

{ #category : 'accessing' }
WATodoWithJQueryItem >> done: anObject [
	done := anObject
]

{ #category : 'initialization' }
WATodoWithJQueryItem >> initializeWithDescription: aString in: aCollection [
	self initialize.
	self done: false.
	self description: aString.
	todos := aCollection
]

{ #category : 'private' }
WATodoWithJQueryItem >> remove [
	todos remove: self
]

{ #category : 'rendering' }
WATodoWithJQueryItem >> renderContentOn: html [
	html listItem
		passenger: self;
		with: [ 
			html div
				class: 'view';
				with:[
					html checkbox
						class: 'toggle';
						callback: [ :value | self done: value ];
						value: done.
					html label: description.
					html button
						class: 'destroy' ].
		html textInput
			class: 'edit';
			style: 'display:none';
			callback: [ :value | self description: value ];
			value: description ]
]
