accessing-status
status: aNumber
	"Set the status to aNumber and associate the default message."

	self status: aNumber message: (self class messageForStatus: aNumber)