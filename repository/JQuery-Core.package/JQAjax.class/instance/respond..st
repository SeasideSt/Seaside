callbacks
respond: aBlock
	"Defines a response callback."

	self callback: [ self requestContext respond: aBlock ]