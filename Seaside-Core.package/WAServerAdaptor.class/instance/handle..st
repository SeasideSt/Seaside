processing
handle: aRequestContext
	"Handle the basic request-response loop."

	self handleRequest: aRequestContext.
	self handlePadding: aRequestContext