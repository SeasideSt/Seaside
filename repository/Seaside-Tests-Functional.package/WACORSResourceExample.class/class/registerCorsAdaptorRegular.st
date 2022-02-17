setup
registerCorsAdaptorRegular

	corsAdaptor := WAAdmin serverAdaptors
		               detect: [ :adaptor | adaptor class == self concreteAdaptorClass and: [ adaptor port = self corsAdaptorPort ] ]
		               ifNone: [ self concreteAdaptorClass port: self corsAdaptorPort ].
	corsAdaptor start