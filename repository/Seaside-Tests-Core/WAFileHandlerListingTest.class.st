Class {
	#name : #WAFileHandlerListingTest,
	#superclass : #WAContextTest,
	#instVars : [
		'handler'
	],
	#category : 'Seaside-Tests-Core-Libraries'
}

{ #category : #testing }
WAFileHandlerListingTest class >> isAbstract [
	^ self name = #WAFileHandlerListingTest
]

{ #category : #testing }
WAFileHandlerListingTest >> assertLibrariesResponse: response [
	self assert: (response contents 
					indexOfSubCollection: self expectedLibrariesContents 
					startingAt: 1) > 0
]

{ #category : #testing }
WAFileHandlerListingTest >> assertLibraryResponse: response [
	self assert: (response contents
					indexOfSubCollection: self expectedLibraryContents
					startingAt: 1) > 0
]

{ #category : #testing }
WAFileHandlerListingTest >> expectedLibrariesContents [
	^ handler libraries first name
]

{ #category : #testing }
WAFileHandlerListingTest >> expectedLibraryContents [
	^ WATestingFiles default filenames detect: [ :each | true ]
]

{ #category : #testing }
WAFileHandlerListingTest >> expectedMimeType [
	self subclassResponsibility
]

{ #category : #testing }
WAFileHandlerListingTest >> expectedStatus [
	^ 200
]

{ #category : #testing }
WAFileHandlerListingTest >> handlerClass [
	self subclassResponsibility
]

{ #category : #testing }
WAFileHandlerListingTest >> testFileLibraries [
	| response |
	handler := WAFileHandler new.
	handler preferenceAt: #fileHandlerListingClass put: self handlerClass.

	self requestContextWithUrl: '/i/dont/care/'.
	self requestContext consumer next; next; next.

	response := self responseAfter: [ handler handle: self requestContext ].

	self assert: response status = self expectedStatus.
	self assert: response contentType = self expectedMimeType.
	self assertLibrariesResponse: response

]

{ #category : #testing }
WAFileHandlerListingTest >> testFileLibrary [
	| response |
	handler := WAFileHandler new.
	handler preferenceAt: #fileHandlerListingClass put: self handlerClass.
	self requestContextWithUrl: '/i/dont/care/WATestingFiles'.
	self requestContext consumer next; next; next.

	response := self responseAfter: [ handler handle: self requestContext ].

	self assert: response status = self expectedStatus.
	self assert: response contentType = self expectedMimeType.
	self assertLibraryResponse: response

]
