parent/child
register: aDocumentHandler
	| handlerKey |
	handlerKey := self documentHandlers store: (aDocumentHandler setParent: self; yourself).
	^ self basicUrl
		addField: self documentHandlerFieldName value: handlerKey;
		yourself