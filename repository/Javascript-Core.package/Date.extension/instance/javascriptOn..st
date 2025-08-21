*javascript-core
javascriptOn: aRenderer
	(aRenderer new: 'Date')
		with: [ 
			aRenderer argument: self year.
			aRenderer argument: self javascriptMonthIndex.
			aRenderer argument: self dayOfMonth ]