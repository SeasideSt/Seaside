Class {
	#name : #WAConfigurationBrowser,
	#superclass : #WADispatcherBrowser,
	#instVars : [
		'selection',
		'editor'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #hooks }
WAConfigurationBrowser >> children [
	^ Array with: editor
]

{ #category : #actions }
WAConfigurationBrowser >> configure: aHandler [
	| configComponent |
	aHandler isDispatcher ifTrue: [ self dispatcher: aHandler ].
	self selection: aHandler.
	self editor home.
	configComponent := aHandler configurationComponent.
	configComponent editor isNil 
		ifFalse: [ configComponent editor beComponent ].
	self show: configComponent
]

{ #category : #accessing }
WAConfigurationBrowser >> defaultDispatcher [
	^ WAAdmin defaultDispatcher
]

{ #category : #accessing }
WAConfigurationBrowser >> editor [
	^ editor
]

{ #category : #accessing }
WAConfigurationBrowser >> editor: aComponent [
	editor := aComponent 
]

{ #category : #actions }
WAConfigurationBrowser >> emptyPage [
	self selection: nil.
	self editor home

]

{ #category : #accessing }
WAConfigurationBrowser >> handlerClasses [
	^ WARequestHandler concreteSubclasses asSortedCollection: [ :a :b | a name < b name ]
]

{ #category : #initialization }
WAConfigurationBrowser >> initializeOn: aDispatcher [
	super initializeOn: aDispatcher.
	self setEmptyPage.
	self configure: aDispatcher

]

{ #category : #actions }
WAConfigurationBrowser >> openHandler: aHandler [
	super openHandler: aHandler.
	aHandler isNil ifFalse: [ self configure: aHandler ]
]

{ #category : #rendering }
WAConfigurationBrowser >> renderContentOn: html [
	html table
		cellspacing: 0;
		cellpadding: 0;
		style: 'width: 100%';
		with: [
			html tableRow: [
				html tableData
					verticalAlign: 'top';
					style: 'padding: 4px; width: 250px;';
					with: [ self renderDispatcherOn: html ].
				html tableData
					verticalAlign: 'top';
					style: 'padding: 4px';
					with: [ self renderEditorOn: html ] ] ]
]

{ #category : #rendering }
WAConfigurationBrowser >> renderEditorOn: html [
	html heading
		class: 'selection-title';
		with: self selection class description, ': ', self selection hierarchyPathString.
		
	html render: editor
]

{ #category : #'rendering-rows' }
WAConfigurationBrowser >> renderRow: aHandler named: aString on: html [
	html tableRow: [
		html tableData: [ self renderRowName: aHandler named: aString on: html ].
		html tableData: [ self renderRowDescription: aHandler on: html ] ]
]

{ #category : #'rendering-rows' }
WAConfigurationBrowser >> renderRowDescription: aHandler  on: html [
	 html render: aHandler class description 
]

{ #category : #'rendering-rows' }
WAConfigurationBrowser >> renderRowName: aHandler named: aString on: html [
	html anchor
		class: 'handler-name';
		class: 'selected' if: aHandler = selection;
		callback: [ self configure: aHandler ];
		with: [
			html text: aString.
			aHandler isDispatcher ifTrue: [ html text: '/' ].
			self dispatcher defaultHandler == aHandler
				ifTrue: [ html span
							title: 'Default handler';
							with: ' (*)' ] ]
]

{ #category : #accessing }
WAConfigurationBrowser >> selection [
	^ selection
]

{ #category : #accessing }
WAConfigurationBrowser >> selection: anObject [
	selection := anObject
]

{ #category : #actions }
WAConfigurationBrowser >> setEmptyPage [
	editor := WADispatcherEmptyPage on: self
]

{ #category : #delegation }
WAConfigurationBrowser >> show: aComponent onAnswer: aBlock [
	self editor show: aComponent onAnswer: aBlock
]

{ #category : #processing }
WAConfigurationBrowser >> updateUrlHandler [
	^ self selection
]
