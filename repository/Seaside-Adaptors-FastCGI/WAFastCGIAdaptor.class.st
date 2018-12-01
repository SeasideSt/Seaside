Class {
	#name : #WAFastCGIAdaptor,
	#superclass : #WAFastCGIRequestConverter,
	#category : 'Seaside-Adaptors-FastCGI'
}

{ #category : #accessing }
WAFastCGIAdaptor class >> defaultPortList [

	^#(9001 9002 9003)
]

{ #category : #private }
WAFastCGIAdaptor >> addCookie: aWACookie toStream: aStream [

	aStream
		nextPutAll: 'Set-Cookie: ';
		nextPutAll: aWACookie key.
	aWACookie value ~~ nil
		ifTrue: [
			aStream
				nextPut: $=;
				nextPutAll: aWACookie value ].
	aWACookie 
		writeExpiresOn: aStream;
		writePathQuoted: false on: aStream;
		writeDomainQuoted: false on: aStream;
		writeSecureOn: aStream;
		writeHttpOnlyOn: aStream.
	aStream
		nextPut: Character cr;
		nextPut: Character lf.
]

{ #category : #private }
WAFastCGIAdaptor >> addCookieOld: aWACookie toStream: aStream [

	aStream
		nextPutAll: 'Set-Cookie: ';
		nextPutAll: aWACookie key.
	aWACookie value ~~ nil
		ifTrue: [
			aStream
				nextPut: $=;
				nextPutAll: aWACookie value ].
	aWACookie 
		writeExpiresOn: aStream;
		writePathQuoted: false on: aStream;
		writeDomainQuoted: false on: aStream;
		writeSecureOn: aStream;
		writeHttpOnlyOn: aStream.
	aStream
		nextPut: Character cr;
		nextPut: Character lf.
]

{ #category : #private }
WAFastCGIAdaptor >> addCookieRFC2965: aWACookie toStream: aStream [

	aStream
		nextPutAll: 'Set-Cookie: ';
		nextPutAll: aWACookie rfc2965String;
		nextPut: Character cr;
		nextPut: Character lf.
]

{ #category : #adapting }
WAFastCGIAdaptor >> answerResponderRole: aFSResponderRole [ 

	| string |
	[ string := self process: aFSResponderRole ] 
		on: Error 
		do: [:ex | 
			string := self internalServerMalfunction: ex.
			"Do an explicit return. Because of the abort above, the default action for an exception (resume) is set. see bug39246."
			ex return: nil].
	aFSResponderRole nextPutAll: string.
	^true
]

{ #category : #private }
WAFastCGIAdaptor >> basicStart [
	server := self createServer.
	server startInForeground
]

{ #category : #private }
WAFastCGIAdaptor >> basicStop [
	server isNil
		ifFalse: [ server stop ].
	server := nil
]

{ #category : #converting }
WAFastCGIAdaptor >> contextFor: aNativeRequest [
	"Answer a request context for aNativeRequest."

	^ WAGemStoneRequestContext
		request: (self requestFor: aNativeRequest)
		response: (self responseFor: aNativeRequest)
		codec: self codec
]

{ #category : #private }
WAFastCGIAdaptor >> createServer [

	^(FSGsSocketServer onRequestHandler: self)
		port: self port;
		yourself.
]

{ #category : #defaults }
WAFastCGIAdaptor >> defaultCodec [

	^GRUtf8GemStoneCodec new
]

{ #category : #'starting/stopping' }
WAFastCGIAdaptor >> gemServerStart [
  "start without blocking"

  [ self basicStart ] fork
]

{ #category : #adapting }
WAFastCGIAdaptor >> internalServerErrorMessage: message [

	| stream crlf list |
	crlf := Character cr asString , Character lf asString.
	(stream := WriteStream on: String new)
		nextPutAll: 'status: 500';
		nextPutAll: crlf;
		nextPutAll: 'content-type: text/html';
		nextPutAll: crlf;
		nextPutAll: crlf;
		nextPutAll: '<h1>Internal Server Error:</h1><h2 style="color: blue">'.
	stream nextPutAll: message.
	stream nextPutAll: '</h2><div style="font-family: sans-serif">You should contact the system administrator</div>'.
	GRPlatform current logError: message title: 'Internal FASTCGI'.
	^stream contents.
]

{ #category : #adapting }
WAFastCGIAdaptor >> internalServerMalfunction: anException [

	| stream encoder crlf list |
	crlf := Character cr asString , Character lf asString.
	stream := WriteStream on: String new.
	stream 
		nextPutAll: 'status: 500';
		nextPutAll: crlf;
		nextPutAll: 'content-type: text/html';
		nextPutAll: crlf;
		nextPutAll: crlf;
		nextPutAll: '<h1>Internal Server Error:</h1><h2 style="color: blue">'.
	encoder := WAXmlEncoder on: stream.
	encoder nextPutAll: anException description.
	stream nextPutAll: '</h2><ol>'.
		((GsProcess stackReportToLevel: 250) subStrings: Character lf) do: [:each | 
			each notEmpty ifTrue: [
				| index |
				stream nextPutAll: '<li>'.
				index := each indexOf: Character space.
				encoder nextPutAll: (each copyFrom: index + 1 to: each size).
				stream nextPutAll: '</li>'.
			].
		].
	stream nextPutAll: '</ol><div style="font-family: sans-serif">You should contact the system administrator</div>'.
	GRPlatform current logError: anException description title: 'Internal FASTCGI'.
	^stream contents.
]

{ #category : #testing }
WAFastCGIAdaptor >> isRunning [
	^ server notNil and: [ server isServing ]
]

{ #category : #testing }
WAFastCGIAdaptor >> isStarting [
	^ server notNil and: [ server isStarting ]
]

{ #category : #testing }
WAFastCGIAdaptor >> isStopped [
	^ server isNil
]

{ #category : #testing }
WAFastCGIAdaptor >> isStopping [
	^ server notNil and: [ server isStopping ]
]

{ #category : #processing }
WAFastCGIAdaptor >> process: aNativeRequest [
	
	^GRPlatform current 
		seasideProcessRequest: aNativeRequest 
		adaptor: self
		resultBlock: [:aRequest | super process: aRequest ]
]

{ #category : #converting }
WAFastCGIAdaptor >> requestFor: aFSResponderRole [

	| req |
	req := super requestFor: aFSResponderRole.
	^req
]

{ #category : #converting }
WAFastCGIAdaptor >> responseFrom: aRequestContext [

	| headers stream crlf contents response contentType | 
	crlf := Character cr asString , Character lf asString.
	response := aRequestContext response.
	self isLogging ifTrue: [ (ObjectLogEntry info: 'Response' object: response copy) addToLog ].
	contents := response stream contents.
	headers := StringKeyValueDictionary new.
	contentType := nil.
	response headers keysAndValuesDo: [ :key :value |
		key = 'Content-Type'
			ifTrue: [ contentType := value greaseString ]
			ifFalse: [ headers at: key put: value greaseString ] ].
	(stream := WriteStream on: String new)
		nextPutAll: 'Status: ';
		nextPutAll: response status asString;
		nextPutAll: crlf;
		nextPutAll: 'Content-length: ';
		nextPutAll: contents size printString;
		nextPutAll: crlf.
	contentType ~~ nil
		ifTrue: [ 
			stream
				nextPutAll: 'Content-type: ';
				nextPutAll: contentType;
				nextPutAll: crlf ].
	headers keys asSortedCollection do: [:key | 
		stream
			nextPutAll: key; 
			nextPutAll: ': ';
			nextPutAll: (headers at: key) greaseString;
			nextPutAll: crlf ].
	response cookies do: [:each | 
		self addCookie: each toStream: stream.
	].
	stream 
		nextPutAll: crlf;
		nextPutAll: contents asString;
		yourself.
	^stream contents
]

{ #category : #mode }
WAFastCGIAdaptor >> setDebugMode [

	FSLog enableLog
]

{ #category : #mode }
WAFastCGIAdaptor >> setDeploymentMode [

	FSLog disableLog
]

{ #category : #mode }
WAFastCGIAdaptor >> setVerboseMode [

	FSLog enableLog
]

{ #category : #private }
WAFastCGIAdaptor >> shutDown [
	server isNil
		ifFalse: [ server stop ]
]

{ #category : #private }
WAFastCGIAdaptor >> startUp [
	server isNil
		ifFalse: [ server start ]
]
