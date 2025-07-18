printing
javascriptContentOn: aRenderer
	(aRenderer new: 'PeriodicalExecuter')
		with: [ 
			self defaultArguments do: [ :each |
				aRenderer argument: each ] ]