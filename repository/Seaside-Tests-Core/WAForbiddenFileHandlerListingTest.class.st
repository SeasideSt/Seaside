Class {
	#name : #WAForbiddenFileHandlerListingTest,
	#superclass : #WAFileHandlerListingTest,
	#category : 'Seaside-Tests-Core-Libraries'
}

{ #category : #testing }
WAForbiddenFileHandlerListingTest >> expectedLibrariesContents [
	^ 'forbidden'
]

{ #category : #testing }
WAForbiddenFileHandlerListingTest >> expectedLibraryContents [
	^ 'forbidden'
]

{ #category : #testing }
WAForbiddenFileHandlerListingTest >> expectedMimeType [
	^ WAMimeType textPlain
]

{ #category : #testing }
WAForbiddenFileHandlerListingTest >> expectedStatus [
	^ 403
]

{ #category : #testing }
WAForbiddenFileHandlerListingTest >> handlerClass [
	^ WAForbiddenFileHandlerListing
]
