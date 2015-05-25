file addition
addFileNamed: filename contents: aByteArrayOrString
	| selector mimeType code contentSelector |
	selector := self asSelector: filename.
	contentSelector := selector, 'Content'.
	mimeType := self mimetypeFor: (filename copyAfterLast: $.).
	
	code := String streamContents: [ :stream |
		stream
			nextPutAll: selector; nextPut: Character cr;
			nextPut: Character tab; nextPutAll: '^ WAFileLibraryResource'; nextPut: Character cr; 
			nextPut: Character tab; nextPut: Character tab; nextPutAll: 'filepath: '''; nextPutAll: filename; nextPutAll: ''''; nextPut: Character cr;
			nextPut: Character tab; nextPut: Character tab; nextPutAll: 'mimeType: (WAMimeType main: '''; nextPutAll: mimeType main; nextPutAll: ''' sub: '''; nextPutAll: mimeType sub; nextPutAll: ''')'; nextPut: Character cr;
			nextPut: Character tab; nextPut: Character tab; nextPutAll: 'cacheDuration: (Duration days: 0 hours: 0 minutes: 30 seconds: 0)'; nextPut: Character cr;
			nextPut: Character tab; nextPut: Character tab;  nextPutAll: 'contents: (GRDelayedSend receiver: self selector: #'; nextPutAll: contentSelector; nextPutAll: ')' ].
		
	GRPlatform current 
		compile: code
		into: self
		classified: self methodCategory, ' metadata'.
		
	(self isBinary: filename)
		ifTrue: [ self compileBinary: aByteArrayOrString selector: contentSelector ]
		ifFalse: [ self compileText: aByteArrayOrString selector: contentSelector ]
		
	