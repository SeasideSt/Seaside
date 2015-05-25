api
expireInPast
	self maxAge: 0.
	self expiry: (DateAndTime now - (Duration days: 10 hours: 0 minutes: 0 seconds: 0))