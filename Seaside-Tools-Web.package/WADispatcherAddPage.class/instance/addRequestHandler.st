actions
addRequestHandler
	| newHandler |
	(name isNil or: [ name isEmpty ])
		ifTrue: [ ^ self inform: 'You must enter a path-name.' onAnswer: [ ] ].
	newHandler := WAAdmin register: type at: name in: self dispatcher.
	newHandler isApplication ifTrue: [ WAAdmin configureNewApplication: newHandler ].
	self answer: newHandler