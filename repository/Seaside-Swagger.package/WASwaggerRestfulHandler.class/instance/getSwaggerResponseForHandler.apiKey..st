misc.
getSwaggerResponseForHandler: handler apiKey: apiKey

	<get>
	<path: '/{handler}.json?api_key={apiKey}'>

	(handler = self swaggerResourcesListHandlerName) ifTrue: [
		self swaggerResourcesForAPIKey: apiKey
	] ifFalse: [
		self swaggerOperationsForHandler: handler apiKey: apiKey
	].