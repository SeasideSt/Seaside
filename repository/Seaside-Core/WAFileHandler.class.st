"
Seaside serves static files using WAFileLibrary subclasses. WAFileHandler handles all requests for WALibrary files (or methods) for all applications on the Seaside server. WAFileHandler is registered with the default WADispatcher automatically.
"
Class {
	#name : #WAFileHandler,
	#superclass : #WARequestHandler,
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-Core-Libraries'
}

{ #category : #accessing }
WAFileHandler class >> default [

	default isNil ifTrue: [ default := self new ].
	^ default
]

{ #category : #accessing }
WAFileHandler class >> default: aFileHandler [
	default := aFileHandler
]

{ #category : #accessing }
WAFileHandler class >> description [
	^ 'File Library'
]

{ #category : #accessing }
WAFileHandler >> baseUrlForLibrary [
	| resourceBaseUrl |
	resourceBaseUrl := self resourceBaseUrl.
	^ resourceBaseUrl isNil
		ifTrue: [ self url ]
		ifFalse: [ resourceBaseUrl copy ]
]

{ #category : #configuration }
WAFileHandler >> defaultConfiguration [
	^ super defaultConfiguration
		removeParent: WARequestHandlingConfiguration instance;
		addParent: WAFileHandlerConfiguration instance;
		yourself
]

{ #category : #configuration }
WAFileHandler >> fileHandlerListingClass [
	^ self preferenceAt: #fileHandlerListingClass
]

{ #category : #handling }
WAFileHandler >> handleFiltered: aRequestContext [
	self responseForContext: aRequestContext
]

{ #category : #accessing }
WAFileHandler >> libraries [
	^ WAAbstractFileLibrary libraries
]

{ #category : #accessing }
WAFileHandler >> libraryAt: aSymbol ifAbsent: aBlock [
	^ self libraries 
		detect: [ :each | each handlesFolder: aSymbol ]
		ifNone: aBlock
]

{ #category : #configuration }
WAFileHandler >> resourceBaseUrl [
	^ self preferenceAt: #resourceBaseUrl
]

{ #category : #private }
WAFileHandler >> responseForContext: aRequestContext [
	| libraryClass consumer |
	consumer := aRequestContext consumer.
	consumer atEnd
		ifTrue: [ ^ (self fileHandlerListingClass on: self context: aRequestContext) responseForLibraries ].
	libraryClass := self 
		libraryAt: consumer next asSymbol
		ifAbsent: [ ^ aRequestContext responseGenerator notFound; respond ].
	consumer atEnd
		ifTrue: [
			| listingClass |
			listingClass := (self fileHandlerListingClass on: self context: aRequestContext).
			listingClass responseForLibrary: libraryClass default ]
		ifFalse: [
			libraryClass handle: aRequestContext.
			" won't be executed if a document is found "
			aRequestContext responseGenerator
				notFound;
				respond ]
]

{ #category : #configuration }
WAFileHandler >> useXSendfile [
	^ self preferenceAt: #useXSendfile
]

{ #category : #configuration }
WAFileHandler >> xSendfileBaseDirectory [
	^ self preferenceAt: #xSendfileBaseDirectory
]
