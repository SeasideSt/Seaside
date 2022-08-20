handling
handle: aRequestContext
	| fileName selector fileHandler |
	fileName := aRequestContext consumer next.
	selector := self asSelector: fileName.
	(self fileSelectors includes: selector) 
		ifFalse: [ ^ self ].
	
	fileHandler := aRequestContext handler.
	fileHandler useXSendfile
		ifTrue: [
			aRequestContext respond: [ :response |
				response
					cacheFor: self cacheDuration;
					headerAt: 'X-Sendfile' put: (self fullPathForFileName: fileName using: fileHandler);
					contentType: (self mimetypeOf: selector) ] ]
		ifFalse: [
			aRequestContext respond: [ :response |
				| document entityTag |
				document := self documentOf: selector.
				entityTag := self entityTagFor: document.
				aRequestContext request ifNoneMatch = entityTag
					ifTrue: [ response notModified ]
					ifFalse: [ 
						response
							cacheFor: self cacheDuration;
							entityTag: entityTag;
							document: document
							mimeType: (self mimetypeOf: selector) ] ] ]