tests-events
testEvery
	self
		assert: (('alert' asFunction: #('ok')) every: 2 "seconds")
		equals: 'new PeriodicalExecuter(function(){function(ok){alert}},2)'