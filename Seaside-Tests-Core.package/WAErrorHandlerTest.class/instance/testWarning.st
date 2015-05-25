tests
testWarning
	| context |
	context := self createRequestContext.
	[ self handlerClass
		handleExceptionsDuring: [ Warning signal ]
		context: context ]
			on: WAResponseNotification
			do: [ :n | self assert: context response status = 500. ^ self ].
			
	self assert: false