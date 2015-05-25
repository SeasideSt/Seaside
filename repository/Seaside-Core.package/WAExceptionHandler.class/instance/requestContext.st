accessing
requestContext
	"Exception handlers are created with a request context because they may
	often be running where WACurrentRequestContext is either undefined or
	unused."
	^ requestContext