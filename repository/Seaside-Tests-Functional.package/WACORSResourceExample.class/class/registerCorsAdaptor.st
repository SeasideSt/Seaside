setup
registerCorsAdaptor

	corsAdaptor := (self concreteAdaptorClass port: self corsAdaptorPort)
		               start