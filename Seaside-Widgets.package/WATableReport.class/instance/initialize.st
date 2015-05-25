initialization
initialize
	super initialize.
	isReversed := false.
	rows := #().
	columns := #().
	sortColumn := WAValueHolder new.
	rowColors := #('#fff' '#eee').
	rowPeriod := 1