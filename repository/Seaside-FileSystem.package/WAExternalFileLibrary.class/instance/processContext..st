handling
processContext: aRequestContext
	| filename |
	filename := self filenameForConsumer: aRequestContext consumer.
	(GRPlatform current isDirectory: filename)
		ifTrue:[ 
			self listing
				ifTrue:[ self
							processDirectory: filename
							context: aRequestContext ]
				ifFalse:[ self respondForbiddenListingFor: aRequestContext ] ]
		ifFalse: [ self processFile: filename context: aRequestContext ]