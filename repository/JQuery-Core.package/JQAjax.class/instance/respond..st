callbacks
respond: aBlock
	"Defines a response callback."

	self privateCallback: [ self requestContext respond: aBlock ]