Class {
	#name : #WAExternalFileLibrary,
	#superclass : #WARequestHandler,
	#category : 'Seaside-FileSystem'
}

{ #category : #accessing }
WAExternalFileLibrary class >> description [
	^ 'File Directory'
]

{ #category : #private }
WAExternalFileLibrary >> asAbsoluteUrl: aFileName relativeTo: aRequest [
	^aRequest url withoutQuery
		addToPath: aFileName;
		yourself
]

{ #category : #private }
WAExternalFileLibrary >> contentsOfFile: aFilename [
	^ GRPlatform current contentsOfFile: aFilename binary: true
]

{ #category : #configuration }
WAExternalFileLibrary >> defaultConfiguration [
	^ super defaultConfiguration
		addParent: WAExternalFileLibraryConfiguration instance;
		yourself
]

{ #category : #accessing }
WAExternalFileLibrary >> directory [

	^ GRPlatform current fileNameFor: (self preferenceAt: #directory)
]

{ #category : #private }
WAExternalFileLibrary >> filenameForConsumer: aPathConsumer [
	"Answer the SpFilename pointing to the file for the given request."
	| filename |
	filename := self directory.
	[ aPathConsumer atEnd ] whileFalse: [
		filename := filename , GRPlatform current pathSeparator , aPathConsumer next ].
	^filename
]

{ #category : #private }
WAExternalFileLibrary >> filesIn: aPath do: aOneArgumentBlock [ 
	"this can not be done with SPort"
	(GRPlatform current filesIn: aPath) do: [ :each |
		aOneArgumentBlock value: (GRPlatform current localNameOf: each) ]
]

{ #category : #handling }
WAExternalFileLibrary >> handleFiltered: aRequestContext [
	[ self processContext: aRequestContext ] 
		on: Error
		do: [ :error | 
			aRequestContext responseGenerator
				internalError: error;
				respond ]
]

{ #category : #accessing }
WAExternalFileLibrary >> listing [
	^ self preferenceAt: #listing
]

{ #category : #private }
WAExternalFileLibrary >> mimetypeForRequest: aRequest [
	| path |
	path := aRequest url path.
	^(path isEmpty or: [ (path last includes: $.) not ])
		ifTrue: [ WAFileLibrary defaultMimeType seasideMimeType ]
		ifFalse: [
			| extension |
			extension := path last copyAfterLast: $..
			WAFileLibrary mimetypeFor: extension ]
]

{ #category : #handling }
WAExternalFileLibrary >> processContext: aRequestContext [
	| filename |
	filename := self filenameForConsumer: aRequestContext consumer.
	(self listing and: [ GRPlatform current isDirectory: filename ])
		ifTrue: [ self
				processDirectory: filename
				context: aRequestContext ]
		ifFalse: [ self processFile: filename context: aRequestContext ]
]

{ #category : #handling }
WAExternalFileLibrary >> processDirectory: aString context: aRequestContext [ 
	| contents |
	contents := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :html | html title: aRequestContext request url greaseString ];
		render: [ :html | 
			html heading
				level: 1;
				with: aRequestContext request url pathStringUnencoded.
			html unorderedList:  [
				self 
					filesIn: aString
					do: [ :each | 
						html listItem: [
							html anchor
								url: (self 
									asAbsoluteUrl: each
									relativeTo: aRequestContext request);
								with: each ] ] ] ].
	aRequestContext respond: [ :response | 
		response
			contentType: WAMimeType textHtml;
			nextPutAll: contents ]
]

{ #category : #handling }
WAExternalFileLibrary >> processFile: aFilename context: aRequestContext [
	aRequestContext respond: [ :response |
		response
			contentType: (self mimetypeForRequest: aRequestContext request);
			binary;
			nextPutAll: (self contentsOfFile: aFilename) ]
]
