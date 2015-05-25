misc.
getSwaggerResponseForHandler: handler

	<get>
	<path: '/{handler}.json'>

	self getSwaggerResponseForHandler: handler apiKey: nil.