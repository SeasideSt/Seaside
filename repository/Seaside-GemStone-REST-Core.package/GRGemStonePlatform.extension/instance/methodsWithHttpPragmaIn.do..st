*seaside-gemstone-REST-core
methodsWithHttpPragmaIn: aClass do: aSixArgumentBlock
	aClass selectorsDo: [ :selector |
		| httpMethodName method |
		httpMethodName := nil.
		method := aClass >> selector.
		method pragmas do: [ :pragma |
			(WARoute httpMethodNames includes: pragma keyword) ifTrue: [
				httpMethodName := pragma keyword greaseString ] ].
		httpMethodName isNil ifFalse: [
			| path consumes produces |
			path := method pragmas detect: [:pragma | pragma keyword == #Path: ] ifNone: [ nil ].
			consumes := self mimeTypeMatchesAt: #Consumes: in: method.
			produces := self mimeTypeMatchesAt: #Produces: in: method.
			aSixArgumentBlock valueWithArguments: (Array
				with: method
				with: selector
				with: httpMethodName
				with: (path isNil ifFalse: [ path argumentAt: 1 ] )
				with: produces
				with: consumes) ] ]