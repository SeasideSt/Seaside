configuration
handlerMetaNode
	| attributes handlers |
	handlers := OBMetaNode named: 'handlers'.
	attributes := OBMetaNode named: 'attributes'.
	attributes addFilter: WAAttributeInheritanceFilter new.
	handlers
		childAt: #children labeled: 'Handlers' put: handlers;
		childAt: #groupedAttributes labeled: 'Config' put: attributes;
		addFilter: OBModalFilter new.
	^ handlers