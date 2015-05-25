configuration
adaptorMetaNode
	| handlers adaptor |
	adaptor := OBMetaNode named: 'adaptor'.
	handlers := self handlerMetaNode.
	adaptor childAt: #requestHandlers labeled: 'handler' put: handlers.
	^ adaptor