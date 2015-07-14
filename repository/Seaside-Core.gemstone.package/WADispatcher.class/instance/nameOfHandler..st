accessing
nameOfHandler: aRequestHandler 
	"Answer the name of the given request handler. Signal an error the given handler is not registered in the receiver."
	^ handlers
		keyAtValue: aRequestHandler
		ifAbsent: [ WAUnregisteredHandlerError signal ]