initialization
initialize
	| now |
	super initialize.
	showSeconds := false.
	now := DateAndTime now.
	hours := now hour.
	minutes := now minute.
	seconds := 0