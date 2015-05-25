handling
processContext: aRequestContext
	| filename |
	filename := self filenameForConsumer: aRequestContext consumer.
	(self listing and: [ GRPlatform current isDirectory: filename ])
		ifTrue: [ self
				processDirectory: filename
				context: aRequestContext ]
		ifFalse: [ self processFile: filename context: aRequestContext ]