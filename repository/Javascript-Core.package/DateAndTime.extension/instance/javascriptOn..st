*javascript-core
javascriptOn: aRenderer
	(aRenderer new: 'Date')
		with: [
			aRenderer 
				argument: self year;
				argument: self javascriptMonthIndex;
				argument: self dayOfMonth;
				argument: self hour;
				argument: self minute;
				argument: self second asInteger ]