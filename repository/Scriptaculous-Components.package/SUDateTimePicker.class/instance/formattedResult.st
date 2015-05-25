accessing
formattedResult
	^ super formattedResult , ' ' , (self withLeadingZero: hours) , ':' , (self withLeadingZero: minutes) , ':'
		, (self withLeadingZero: seconds)