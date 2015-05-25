printing
encodeOn: aDocument
	(GRPrinter rfc822WithTimeZone: self timeZoneString)
		print: self dateAndTime
		on: aDocument