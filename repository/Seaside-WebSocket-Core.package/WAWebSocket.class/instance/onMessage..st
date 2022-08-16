events
onMessage: aOnceOrTwoArgumentBlock
	"Set the handler block to invoke when a message is received.
	The first argument will be the data.
	The second argument will be the type."
	self subclassResponsibility