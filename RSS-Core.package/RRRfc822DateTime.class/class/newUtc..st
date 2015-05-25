instance creation
newUtc: aDateAndTime
	^ self dateAndTime: aDateAndTime asUTC timeZoneString: 'UT'