enumerating
datesDo: aBlock separatedBy: monthlyBlock
	| month |
	month := datesCache first monthIndex.
	datesCache do: [ :date |
		date monthIndex = month ifFalse: [ month := date monthIndex. monthlyBlock value ].
		aBlock value: date ].
	monthlyBlock value