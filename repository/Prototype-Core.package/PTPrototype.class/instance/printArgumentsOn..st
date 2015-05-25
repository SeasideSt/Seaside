printing
printArgumentsOn: aStream
	| arguments |
	arguments := self defaultArguments
		ifNil: [ ^ self ].
	JSStream encodeArguments: arguments on: aStream