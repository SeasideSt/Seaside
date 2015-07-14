api
expireIn: aDuration
	"sets the lifetime of the receiver measured in a duration"
	self expiry: DateAndTime now + aDuration.
	self maxAge: aDuration asSeconds