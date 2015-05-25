filters-convenience
exceptionHandler: anExceptionHandlerClass
	| theFilter |
	theFilter := self filters
		detect: [ :ea | ea isExceptionFilter ]
		ifNone: [ self addFilter: WAExceptionFilter new ].
	
	theFilter configuration at: #exceptionHandler put: anExceptionHandlerClass