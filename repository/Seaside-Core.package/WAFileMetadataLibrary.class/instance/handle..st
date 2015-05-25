handling
handle: aRequestContext
	| filepath selector fileHandler fileResource |
	filepath := String streamContents: [ :stream | 
		aRequestContext consumer upToEnd
			do: [ :each | 
				stream nextPutAll: each ] 
			separatedBy: [ stream nextPutAll: GRPlatform current pathSeparator ] ].
		
	selector := self asSelector: filepath.
	(self fileSelectors includes: selector) 
		ifFalse: [ ^ self ].
	
	fileResource := self fileResourceOf: selector.
	fileHandler := aRequestContext handler.
	fileHandler useXSendfile
		ifTrue: [
			aRequestContext respond: [ :response |
				response
					cacheFor: fileResource cacheDuration;
					headerAt: 'X-Sendfile' put: (self fullPathForFileName: filepath using: fileHandler);
					contentType: fileResource mimeType ] ]
		ifFalse: [
			aRequestContext respond: [ :response |
				response
					cacheFor: fileResource cacheDuration;
					document: fileResource contents value
					mimeType: fileResource mimeType ] ]