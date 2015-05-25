double-disptach
dateAndTime: aDateAndTime
	" Note: date and time is not standard json. So we use the ISO 8601 standard here. We convert to string to make it valid json "
	self document stream nextPut: $".
	aDateAndTime printOn: self document stream.
	self document stream nextPut: $".
