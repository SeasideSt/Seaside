Class {
	#name : #WAForbiddenFileHandlerListing,
	#superclass : #WAFileHandlerListing,
	#category : 'Seaside-Core-Libraries'
}

{ #category : #responding }
WAForbiddenFileHandlerListing >> responseForLibraries [
	context responseGenerator
		forbidden;
		respond
]

{ #category : #responding }
WAForbiddenFileHandlerListing >> responseForLibrary: aLibrary [ 
	context responseGenerator
		forbidden;
		respond
]
