Class {
	#name : #WATodoItem,
	#superclass : #WAComponent,
	#instVars : [
		'todos',
		'description',
		'done'
	],
	#category : 'Seaside-Examples-Misc'
}

{ #category : #'instance creation' }
WATodoItem class >> newWithDescription: aString in: aCollection [
	^ self new initializeWithDescription: aString in: aCollection
]

{ #category : #accessing }
WATodoItem >> description [
	^ description
]

{ #category : #accessing }
WATodoItem >> description: anObject [
	description := anObject
]

{ #category : #accessing }
WATodoItem >> done [
	^ done
]

{ #category : #accessing }
WATodoItem >> done: anObject [
	done := anObject
]

{ #category : #initialization }
WATodoItem >> initializeWithDescription: aString in: aCollection [
	self initialize.
	self done: false.
	self description: aString.
	todos := aCollection
	
]

{ #category : #private }
WATodoItem >> remove [
	todos remove: self
]

{ #category : #rendering }
WATodoItem >> renderContentOn: html [
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
