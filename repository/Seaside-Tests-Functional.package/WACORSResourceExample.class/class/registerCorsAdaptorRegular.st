setup
registerCorsAdaptorRegular

	CorsAdaptor := WAAdmin serverAdaptors
		               detect: [ :adaptor | adaptor class == self concreteAdaptorClass and: [ adaptor port = self corsAdaptorPort ] ]
		               ifNone: [ self concreteAdaptorClass port: self corsAdaptorPort ].
	CorsAdaptor start