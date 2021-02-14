Class {
	#name : #WATextFileHandlerListing,
	#superclass : #WAFileHandlerListing,
	#category : 'Seaside-Core-Libraries'
}

{ #category : #responding }
WATextFileHandlerListing >> responseForLibraries [
	context respond: [ :response |
		response contentType: WAMimeType textPlain.
		handler libraries do: [ :each |
			response stream
				nextPutAll: each name;
				crlf ] ]
]

{ #category : #responding }
WATextFileHandlerListing >> responseForLibrary: aLibrary [
	context respond: [ :response |
		response contentType: WAMimeType textPlain.
		aLibrary fileSelectors do: [ :each |
			response stream
				nextPutAll: (aLibrary asFilename: each);
				crlf ] ]
]
