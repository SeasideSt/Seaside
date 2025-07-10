double-dispatch
dateAndTime: aDateAndTime
	" Note: date and time is not standard json. So we use the ISO 8601 standard here. We convert to string to make it valid json."
	self flag: #TODO. "will have to change"
	self document beginString.
	aDateAndTime printOn: self document stream.
	self document endString