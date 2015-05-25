tests
testError
	| context |
	context := self createRequestContext.
	[ self handlerClass
		handleExceptionsDuring: [ WAError signal ]
		context: context ]
			on: WAResponseNotification
			do: [ :n | self assert: context response status = 500. ^ self ].
			
	self assert: false