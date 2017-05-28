printing
javascriptContentOn: aStream
	aStream nextPutAll: 'new PeriodicalExecuter'.
	JSStream
		encodeArguments: self defaultArguments
		on: aStream