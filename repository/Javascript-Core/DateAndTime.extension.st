Extension { #name : 'DateAndTime' }

{ #category : '*javascript-core' }
DateAndTime >> javascriptMonthIndex [
	^ self monthIndex - 1
]

{ #category : '*javascript-core' }
DateAndTime >> javascriptOn: aRenderer [
	(aRenderer new: 'Date')
		with: [
			aRenderer 
				argument: self year;
				argument: self javascriptMonthIndex;
				argument: self dayOfMonth;
				argument: self hour;
				argument: self minute;
				argument: self second ]
]
