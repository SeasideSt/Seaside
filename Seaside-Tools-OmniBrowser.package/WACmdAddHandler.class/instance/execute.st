execution
execute
	| name handler |
	name := OBTextRequest prompt: 'Entry point name:'.
	(name isNil or: [ name isEmpty ]) ifTrue: [ ^ self ].
	handler := WAAdmin register: type at: name in: target handler.
	handler isApplication ifTrue: [ WAAdmin configureNewApplication: handler ].
	requestor browser announce: (OBNodeCreated node: handler asNode)