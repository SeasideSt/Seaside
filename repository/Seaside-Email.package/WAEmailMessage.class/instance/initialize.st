initialization
initialize
	super initialize.
	to := OrderedCollection new.
	cc := OrderedCollection new.
	bcc := OrderedCollection new.
	headers := Dictionary new.
	self 
		headerAt: 'Date'
		put: (GRPrinter rfc822 print: DateAndTime now)