initialization
initialize
	super initialize.
	table := WASelectionDateTable new
		startDate: (Date year: 2012 month: 1 day: 1);
		endDate: (Date year: 2012 month: 1 day: 6);
		rowsAndDatesDisplay: [ :row :date |
			(GRPrinter isoDate print: date), ' (', row greaseString, ')' ];
		rows: (1 to: 10)
		yourself