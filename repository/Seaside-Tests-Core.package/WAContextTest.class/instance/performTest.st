running
performTest

	requestContext := self createRequestContext.
	WACurrentRequestContext 
		use: self requestContext
		during: [
			self
				pushAll: self createHandlers
				during: [ super performTest ] ]