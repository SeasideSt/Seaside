testing
testPathForRequest
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
	self assert: (fileSystem filenameForConsumer: consumer) = resultPath.