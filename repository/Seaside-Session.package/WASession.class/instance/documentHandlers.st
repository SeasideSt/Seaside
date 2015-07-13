accessing
documentHandlers
	documentHandlers isNil ifTrue: [
		documentHandlers := self createDocumentHandlerCache ].
	^ documentHandlers