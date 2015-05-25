tests
testSimpleCallCCWithPossibleArgument
	| x continuation |
	x := self callcc: [ :cc | continuation := cc. false ].
	x ifFalse: [ continuation valueWithPossibleArguments: (Array with:  true) ].
	self assert: x