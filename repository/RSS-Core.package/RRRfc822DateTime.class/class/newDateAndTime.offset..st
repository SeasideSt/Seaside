instance creation
newDateAndTime: aDateAndTime offset: aDuration
	^ self
		dateAndTime: aDateAndTime
		timeZoneString: (self offsetString: aDuration)