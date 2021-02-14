"
I am a utility class used to initialize and provide a default environment.
"
Class {
	#name : #WAEnvironment,
	#superclass : #WAObject,
	#classInstVars : [
		'configuredApplicationDefaults'
	],
	#category : 'Seaside-Environment'
}

{ #category : #'class initialization' }
WAEnvironment class >> configureApplicationDefaults [
	(configuredApplicationDefaults ifNil: [ false ]) ifFalse: [
		WAAdmin applicationDefaults
			at: #responseGenerator putClass: WAHtmlResponseGenerator.
		configuredApplicationDefaults := true ]
	
]

{ #category : #'class initialization' }
WAEnvironment class >> initialize [
	self configureApplicationDefaults.
	self registerDefaultRequestHandlers.
	self registerDefaultComponents
]

{ #category : #registration }
WAEnvironment class >> registerDefaultComponents [
	WAPainter allSubclasses do: [ :each |
		(each class includesSelector: #initialize)
			ifTrue: [ each initialize ] ]
]

{ #category : #registration }
WAEnvironment class >> registerDefaultRequestHandlers [
	WAFileHandler default: WAFileHandler new.
	WAFileHandler default 
		preferenceAt: #fileHandlerListingClass
		put: WAHtmlFileHandlerListing.
	WAAdmin defaultDispatcher 
		register: WAFileHandler default
		at: 'files'.
	WAAdmin defaultDispatcher 
		register: WALegacyRedirectionHandler new
		at: 'seaside'
]

{ #category : #registration }
WAEnvironment class >> reloadApplications [
	WAAdmin clearAll.
	self registerDefaultRequestHandlers.
	self registerDefaultComponents
]
