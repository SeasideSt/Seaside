testing
testHandlerClassValidExceptionSelector
	"The ANSI standard specifies that an object must implement #handles: and #, in
	order to be used as an 'exception selector' (that is, as the first paramter to #on:do:).
	However, some platforms seem to require other protocol. This test will make sure
	that each platform has implemented what is required to make this work."
	
	[ [ self unhandledExceptionClass signal ]
		on: self handlerClass
		do: [ :exception | self assert: false ] ]
			on: Exception
			do: [ :exception | ^ self "test passed" ].
		
	self assert: false "The method should have returned already"