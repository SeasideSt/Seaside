parent/child
register: aRequestHandler
	| key |
	key := self cache store: (aRequestHandler setParent: self; yourself).
	^ self basicUrl
		addField: self documentHandlerFieldName value: key;
		yourself