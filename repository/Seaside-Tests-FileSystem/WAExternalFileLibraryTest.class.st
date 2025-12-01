Class {
	#name : 'WAExternalFileLibraryTest',
	#superclass : 'TestCase',
	#instVars : [
		'fileSystem'
	],
	#category : 'Seaside-Tests-FileSystem',
	#package : 'Seaside-Tests-FileSystem'
}

{ #category : 'testing' }
WAExternalFileLibraryTest >> crossPlatformPathFromArray: pathArray finalSlash: finalSlash [
	
	^ String streamContents: [ :stream |
		| separator |
		separator := GRPlatform current pathSeparator.
		pathArray do: [ :pathElement | 
			stream
				nextPutAll: separator;
				nextPutAll: pathElement ].
		finalSlash ifTrue: [
			stream nextPutAll: separator ] ]

]

{ #category : 'private' }
WAExternalFileLibraryTest >> requestWithUrl: aString [
	^ WARequest method: 'POST' uri: aString
]

{ #category : 'running' }
WAExternalFileLibraryTest >> setUp [
	super setUp.
	fileSystem := WAExternalFileLibrary new.
	WADispatcher new register: fileSystem at: 'culture'
]

{ #category : 'testing' }
WAExternalFileLibraryTest >> testAsAbsoluteUrlRelativeTo [
	| request |
	fileSystem configuration 
		at: #directory
		put: '/home/philppe/pr0n'.
	request := self requestWithUrl: '/culture/pictures'.
	self assert: (fileSystem 
			asAbsoluteUrl: 'cleopatra.jpeg'
			relativeTo: request) greaseString = '/culture/pictures/cleopatra.jpeg'.
	request := self requestWithUrl: '/culture/pictures/'.
	self assert: (fileSystem 
			asAbsoluteUrl: 'cleopatra.jpeg'
			relativeTo: request) greaseString = '/culture/pictures/cleopatra.jpeg'
]

{ #category : 'testing' }
WAExternalFileLibraryTest >> testDefaultDirectoryPathString [
	self assert: GRPlatform current defaultDirectoryPathString isString
]

{ #category : 'testing' }
WAExternalFileLibraryTest >> testFileNameFor [
	| platform |
	platform := GRPlatform current.
	self assert: (platform fileNameFor: platform defaultDirectoryPathString) = platform defaultDirectoryPathString.
	self assert: (platform fileNameFor: platform defaultDirectoryPathString, platform pathSeparator) = platform defaultDirectoryPathString
]

{ #category : 'testing' }
WAExternalFileLibraryTest >> testIsDirectory [
	self assert: (GRPlatform current isDirectory: (GRPlatform current defaultDirectoryPathString))
]

{ #category : 'testing' }
WAExternalFileLibraryTest >> testMimetypeForRequest [
	| request |
	request := self requestWithUrl: '/culture/pictures/cleopatra.jpeg'.
	self assert: (fileSystem mimetypeForRequest: request) = 'image/jpeg' seasideMimeType.
	
	request := self requestWithUrl: '/culture/pictures/cleopatra'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/octet-stream' seasideMimeType.
	
	request := self requestWithUrl: '/culture/pictures/cleopatra.'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/octet-stream' seasideMimeType.
	
	request := self requestWithUrl: '/'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/octet-stream' seasideMimeType.
	
	request := self requestWithUrl: '/culture/pictures/cleopatra.js'.
	self assert: (fileSystem mimetypeForRequest: request) = 'application/javascript' seasideMimeType
]

{ #category : 'testing' }
WAExternalFileLibraryTest >> testPathForRequest [
	"self debug: #testPathForRequest"

	| consumer requestPath resultPath filename |

	"/home/philppe/files"
	requestPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files') finalSlash: false.
	fileSystem configuration at: #directory put: requestPath.
	"/culture is mapped to /home/philppe/files"
	
	"If you're looking this test and it doesn't seem to make sense, keep in mind that a file name is this context is an SpFilename, which is a path."
	consumer := WAPathConsumer path: #('cleopatra.jpeg') asOrderedCollection.
	"/home/philppe/files/cleopatra.jpeg"
	resultPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files' 'cleopatra.jpeg') finalSlash: false.
	filename := fileSystem filenameForConsumer: consumer.
	self assert: filename = resultPath.
	

	consumer := WAPathConsumer path: #('culture' 'cleopatra.jpeg') asOrderedCollection.
	"/home/philppe/files/"
	requestPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files') finalSlash: true.
	fileSystem configuration at: #directory put: requestPath.
	
	consumer := WAPathConsumer path: #('cleopatra.jpeg') asOrderedCollection.
	"/home/philppe/files/cleopatra.jpeg"
	resultPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files' 'cleopatra.jpeg') finalSlash: false.
	filename := fileSystem filenameForConsumer: consumer.
	self assert: filename = resultPath.
	
	
	consumer := WAPathConsumer path: #('cleopatra.jpeg') asOrderedCollection.
	"/home/philppe/files"
	requestPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files') finalSlash: false.
	fileSystem configuration at: #directory put: requestPath.
	
	"/home/philppe/files/cleopatra.jpeg"
	resultPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files' 'cleopatra.jpeg') finalSlash: false.
	self assert: (fileSystem filenameForConsumer: consumer) = resultPath.
	
	
	consumer := WAPathConsumer path: #('cleopatra.jpeg') asOrderedCollection.
	"/home/philppe/files/"
	requestPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files') finalSlash: true.
	fileSystem configuration at: #directory put: requestPath.
	
	consumer := WAPathConsumer path: #('cleopatra.jpeg') asOrderedCollection.
	"/home/philppe/files/cleopatra.jpeg"
	resultPath := self crossPlatformPathFromArray: #('home' 'philppe' 'files' 'cleopatra.jpeg') finalSlash: false.
	self assert: (fileSystem filenameForConsumer: consumer) = resultPath
]
