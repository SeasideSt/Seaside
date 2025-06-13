handling
handleFiltered: aRequestContext 
	"Handle aRequestContext by either dispatching to a different request handler of by producing a response and signalling the result."

	self subclassResponsibility