printing
printArgumentsOn: aRenderer
	| arguments |
	arguments := self defaultArguments
		ifNil: [ ^ self ].
	aRenderer arguments: [ 
		arguments do: [ :each |
			aRenderer argument: each ] ]