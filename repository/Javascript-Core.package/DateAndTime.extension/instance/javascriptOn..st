*javascript-core
javascriptOn: aRenderer
	(aRenderer new: 'Date')
		with: [
			#( year javascriptMonthIndex dayOfMonth hour minute second ) do: [ :each |
				aRenderer argument: (self perform: each) ]  ]