accessing-headers
forwarded
	^ self headerAt: 'forwarded' ifAbsent:[ self headerAt: 'x-forwarded-for' ]