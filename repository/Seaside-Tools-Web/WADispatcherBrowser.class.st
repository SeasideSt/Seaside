Class {
	#name : #WADispatcherBrowser,
	#superclass : #WAComponent,
	#instVars : [
		'dispatcher'
	],
	#category : 'Seaside-Tools-Web'
}

{ #category : #testing }
WADispatcherBrowser class >> canBeRoot [
	^ true
]

{ #category : #accessing }
WADispatcherBrowser class >> description [
	^ 'Dispatcher Viewer'
]

{ #category : #initialization }
WADispatcherBrowser class >> initialize [
	(WAAdmin register: self asApplicationAt: 'browse') 
		addLibrary: WAToolFiles.
	WAAdmin defaultDispatcher defaultName: 'browse'
]

{ #category : #'instance creation' }
WADispatcherBrowser class >> new [
	^ self on: WAAdmin defaultDispatcher
]

{ #category : #'instance creation' }
WADispatcherBrowser class >> on: anEntryPoint [
	^ self basicNew initializeOn: anEntryPoint; yourself
]

{ #category : #accessing }
WADispatcherBrowser >> dispatcher [
	^ dispatcher
]

{ #category : #accessing }
WADispatcherBrowser >> dispatcher: aDispatcher [
	dispatcher := aDispatcher
]

{ #category : #accessing }
WADispatcherBrowser >> handlers [
	"Answer a dictionary of the visible request handlers."

	^ self dispatcher handlers
]

{ #category : #hooks }
WADispatcherBrowser >> initialRequest: aRequest [
	"Check my relative URL, if the last entry is an application open the config editor, else open the dispatcher editor."
	
	super initialRequest: aRequest.
	self openHandler: self lookupHandler
]

{ #category : #initialization }
WADispatcherBrowser >> initializeOn: aDispatcher [
	self initialize.
	dispatcher := aDispatcher
]

{ #category : #actions }
WADispatcherBrowser >> lookupHandler [
	| consumer requesthandler |
	consumer := self requestContext consumer.
	requesthandler := self dispatcher.
	[ consumer atEnd ] whileFalse: [
		requesthandler := requesthandler isDispatcher
				ifFalse: [ ^ requesthandler ]
				ifTrue: [
					requesthandler handlers 
						at: consumer next
						ifAbsent: [ ^ nil ] ] ].
	^ requesthandler
]

{ #category : #actions }
WADispatcherBrowser >> openHandler: aHandler [
	aHandler isNil ifTrue: [ ^ self ].
	self dispatcher: (aHandler isDispatcher
		ifFalse: [ aHandler parent ]
		ifTrue: [ aHandler ])
]

{ #category : #rendering }
WADispatcherBrowser >> renderContentOn: html [
	self renderHeadingOn: html.
	self renderDispatcherOn: html
]

{ #category : #rendering }
WADispatcherBrowser >> renderDispatcherOn: html [
	html table: [
		self renderRow: self dispatcher named: '.' on: html.
		self dispatcher isRoot
			ifFalse: [ self renderRow: self dispatcher parent named: '..' on: html ].
		self handlers keys sorted
			do: [ :each | self renderRow: (self dispatcher handlers at: each) named: each on: html ] ]
]

{ #category : #rendering }
WADispatcherBrowser >> renderHeadingOn: html [
	html heading class: 'logo'; with: [
		html anchor
			url: (WAUrl new 
				host: 'www.seaside.st';
				yourself);
			with: 'Seaside' ].
	html heading class: 'title'; with: [
		html anchor
			url: self dispatcher url;
			with: self title ]
]

{ #category : #'rendering-rows' }
WADispatcherBrowser >> renderRow: anEntryPoint named: aString on: html [
	html tableRow: [
		html tableData: [ self renderRowName: anEntryPoint named: aString on: html ].
		html tableData: [ self renderRowDescription: anEntryPoint named: aString on: html ].
		html tableData: [ self renderRowActions: anEntryPoint named: aString on: html ] ]
]

{ #category : #'rendering-rows' }
WADispatcherBrowser >> renderRowActions: anEntryPoint named: aString on: html [
]

{ #category : #'rendering-rows' }
WADispatcherBrowser >> renderRowDescription: aHandler named: aString on: html [
	html render: aHandler class description
]

{ #category : #'rendering-rows' }
WADispatcherBrowser >> renderRowName: aHandler named: aString on: html [
	aHandler isDispatcher
		ifTrue: [
			html anchor
				extraPath: aString;
				callback: [ self dispatcher: aHandler ];
				with: [ html code: aString , '/' ] ]
		ifFalse: [
			html anchor 
				url: aHandler url; 
				with: [ html code: aString ] ]
]

{ #category : #hooks }
WADispatcherBrowser >> states [
	^ Array with: self
]

{ #category : #accessing }
WADispatcherBrowser >> title [
	^ self dispatcher class description , ' at ' , self dispatcher hierarchyPathString
]

{ #category : #updating }
WADispatcherBrowser >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: self title
]

{ #category : #updating }
WADispatcherBrowser >> updateUrl: aUrl [
	super updateUrl: aUrl.
	self updateUrlHandler hierarchyNames do: [ :each | aUrl addToPath: each ]
]

{ #category : #processing }
WADispatcherBrowser >> updateUrlHandler [
	^ self dispatcher
]
