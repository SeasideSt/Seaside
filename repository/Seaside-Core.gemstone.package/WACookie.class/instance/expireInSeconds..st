api
expireInSeconds: anInteger
	"sets the lifetime of the receiver measured in seconds"
	self expiry: (Duration days: 0 hours: 0 minutes: 0 seconds: anInteger).
	self maxAge: anInteger