testing
testUnhandledException
	[ self handlerClass
		handleExceptionsDuring: [ self unhandledExceptionClass signal ]
		context: self requestContext ]
			on: self unhandledExceptionClass
			do: [ :exception | "success" ^ self ].
	
	self assert: false