converting
responseFrom: aRequestContext

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