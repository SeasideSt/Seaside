initialization
initialize
	super initialize.
	beginDate := WADateSelector new.
	endDate := WADateSelector new.
	endDate date: (Date today addDays: 1).

	beginTime := WATimeSelector new.
	beginTime time: Time now.
	endTime := WATimeSelector new.
	endTime time: (beginTime time addSeconds: 3600).

	beginDAT := WADateTimeSelector new.
	endDAT := WADateTimeSelector new.
	endDAT dateAndTime: beginDAT dateAndTime + 1 days + 1 hours