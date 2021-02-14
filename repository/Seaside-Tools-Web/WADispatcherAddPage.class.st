Class {
	#name : #WADispatcherAddPage,
	#superclass : #WADispatcherSubPage,
	#instVars : [
		'name',
		'type',
		'dispatcher'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #actions }
WADispatcherAddPage >> addRequestHandler [
	| newHandler |
	(name isNil or: [ name isEmpty ])
		ifTrue: [ ^ self inform: 'You must enter a path-name.' onAnswer: [ ] ].
	newHandler := WAAdmin register: type at: name in: self dispatcher.
	newHandler isApplication ifTrue: [ WAAdmin configureNewApplication: newHandler ].
	self answer: newHandler
]

{ #category : #accessing }
WADispatcherAddPage >> dispatcher [
	^ dispatcher
]

{ #category : #accessing }
WADispatcherAddPage >> dispatcher: anObject [
	dispatcher := anObject
]

{ #category : #accessing }
WADispatcherAddPage >> handlerClasses [
	^ WARequestHandler concreteSubclasses asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #rendering }
WADispatcherAddPage >> renderContentOn: html [
	html heading level: 3; with: 'Add new request handler'.
	html form: [
		html table: [
			html tableRow: [
				html tableData class: 'label'; with: 'Name: '.
				html tableData: [
					html textInput
						callback: [ :value | name := value ] ] ].
			html tableRow: [
				html tableData class: 'label'; with: 'Type: '.
				html tableData: [
					html select
						selected: type;
						list: self handlerClasses;
						callback: [ :value | type := value ];
						labels: [ :each | each description ] ] ] ].
			html break.
				html submitButton
					callback: [ self addRequestHandler ];
					with: 'OK'.
				html space.
				html submitButton
					callback: [ self answer: nil ];
					with: 'Cancel'  ]  
]
