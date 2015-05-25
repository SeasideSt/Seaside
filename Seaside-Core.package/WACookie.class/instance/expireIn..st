api
expireIn: aDuration
	"sets the lifetime of the receiver mesaured in a duration"
	self expiry: DateAndTime now + aDuration.
	self maxAge: aDuration asSeconds